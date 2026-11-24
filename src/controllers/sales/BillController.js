const db = require('../../database');
const Bill = db.Bill;
const BillItem = db.BillItem;
const BillCalculationService = require('../../services/billCalculationService');
const { Op } = require('sequelize');

/**
 * Generate unique bill number
 */
const generateBillNumber = async (userCompanyId) => {
  try {
    const today = new Date().toISOString().split('T')[0].replace(/-/g, '');
    const todayStart = new Date().toISOString().split('T')[0];
    const todayEnd = new Date(new Date().getTime() + 24 * 60 * 60 * 1000).toISOString().split('T')[0];
    
    const count = await Bill.count({
      where: {
        userCompanyId,
        date: {
          [Op.gte]: todayStart,
          [Op.lt]: todayEnd,
        },
      },
    });
    return `BILL-${today}-${String(count + 1).padStart(4, '0')}`;
  } catch (error) {
    console.error('Error generating bill number:', error);
    return `BILL-${Date.now()}`;
  }
};

/**
 * Create a new bill
 */
const createBill = async (req, res) => {
  try {
    const { items, billDiscountPercent = 0, cgstPercent = 0, sgstPercent = 0, ...billData } = req.body;
    const userCompanyId = req.companyId || req.user?.userCompanyId;
    const userId = req.user?.id;

    if (!userCompanyId) {
      return res.status(400).json({
        success: false,
        message: 'Company ID is required',
      });
    }

    // Validate bill data
    BillCalculationService.validateBillData({ ...billData, items });

    // Generate bill number if not provided
    if (!billData.billNo) {
      billData.billNo = await generateBillNumber(userCompanyId);
    }

    // Calculate totals with proper tax structure
    const calculations = BillCalculationService.calculateBillTotals(
      items || [],
      billDiscountPercent,
      {
        igstPercent: 0,
        cgstPercent,
        sgstPercent,
        cessPercent: 0,
      }
    );

    // Create bill with calculated values
    const bill = await Bill.create({
      ...billData,
      userCompanyId,
      createdBy: userId,
      updatedBy: userId,
      ...calculations,
      paymentStatus: BillCalculationService.getPaymentStatus(calculations.totalAmount, 0),
    });

    // Create bill items
    if (items && items.length) {
      for (const item of calculations.items) {
        await BillItem.create({
          ...item,
          billId: bill.id,
        });
      }
    }

    const fullBill = await Bill.findByPk(bill.id, {
      include: [{ model: BillItem, as: 'billItems' }],
    });

    res.status(201).json({
      success: true,
      message: 'Bill created successfully',
      data: fullBill,
    });
  } catch (error) {
    console.error('Error creating bill:', error);
    res.status(400).json({
      success: false,
      message: error.message,
    });
  }
};

/**
 * Get all bills with pagination and filtering
 */
const getAllBills = async (req, res) => {
  try {
    const userCompanyId = req.companyId || req.user?.userCompanyId;
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 10;
    const offset = (page - 1) * limit;
    const search = req.query.search || '';

    if (!userCompanyId) {
      return res.status(400).json({
        success: false,
        message: 'Company ID is required',
      });
    }

    const where = { userCompanyId };

    if (search) {
      where[Op.or] = [
        { billNo: { [Op.iLike]: `%${search}%` } },
        { patientName: { [Op.iLike]: `%${search}%` } },
        { partyName: { [Op.iLike]: `%${search}%` } },
        { doctorName: { [Op.iLike]: `%${search}%` } },
      ];
    }

    if (req.query.status) {
      where.status = req.query.status;
    }

    if (req.query.paymentStatus) {
      where.paymentStatus = req.query.paymentStatus;
    }

    const { count, rows } = await Bill.findAndCountAll({
      where,
      offset,
      limit,
      order: [['createdAt', 'DESC']],
      include: [{ model: BillItem, as: 'billItems' }],
      raw: false,
    });

    res.status(200).json({
      success: true,
      data: rows,
      total: count,
      page,
      totalPages: Math.ceil(count / limit),
    });
  } catch (error) {
    console.error('Error fetching bills:', error);
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

/**
 * Get bill by ID
 */
const getBillById = async (req, res) => {
  try {
    const { id } = req.params;
    const userCompanyId = req.companyId || req.user?.userCompanyId;

    if (!userCompanyId) {
      return res.status(400).json({
        success: false,
        message: 'Company ID is required',
      });
    }

    const bill = await Bill.findOne({
      where: { id, userCompanyId },
      include: [{ model: BillItem, as: 'billItems' }],
    });

    if (!bill) {
      return res.status(404).json({
        success: false,
        message: `Bill with ID ${id} not found`,
      });
    }

    res.status(200).json({
      success: true,
      data: bill,
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

/**
 * Update bill
 */
const updateBill = async (req, res) => {
  const { id } = req.params;
  if (!id) {
    return res.status(400).json({
      success: false,
      message: 'Bill ID is required',
    });
  }

  try {
    const userCompanyId = req.companyId || req.user?.userCompanyId;
    const userId = req.user?.id;
    const { items, billDiscountPercent = 0, cgstPercent = 0, sgstPercent = 0, ...billData } = req.body;

    if (!userCompanyId) {
      return res.status(400).json({
        success: false,
        message: 'Company ID is required',
      });
    }

    const bill = await Bill.findOne({
      where: { id, userCompanyId },
    });

    if (!bill) {
      return res.status(404).json({
        success: false,
        message: 'Bill not found',
      });
    }

    // Validate bill data
    BillCalculationService.validateBillData({ ...billData, items });

    // Calculate totals with proper tax structure
    const calculations = BillCalculationService.calculateBillTotals(
      items || [],
      billDiscountPercent,
      {
        igstPercent: 0,
        cgstPercent,
        sgstPercent,
        cessPercent: 0,
      }
    );

    // Update bill
    await bill.update({
      ...billData,
      updatedBy: userId,
      ...calculations,
      paymentStatus: BillCalculationService.getPaymentStatus(
        calculations.totalAmount,
        billData.paidAmount || bill.paidAmount || 0
      ),
    });

    // Update bill items
    await BillItem.destroy({ where: { billId: bill.id } });
    if (items && items.length) {
      for (const item of calculations.items) {
        await BillItem.create({
          ...item,
          billId: bill.id,
        });
      }
    }

    const fullBill = await Bill.findByPk(bill.id, {
      include: [{ model: BillItem, as: 'billItems' }],
    });

    res.status(200).json({
      success: true,
      message: 'Bill updated successfully',
      data: fullBill,
    });
  } catch (error) {
    console.error('Error updating bill:', error);
    res.status(400).json({
      success: false,
      message: error.message,
    });
  }
};

/**
 * Delete bill
 */
const deleteBill = async (req, res) => {
  const { id } = req.params;
  try {
    const userCompanyId = req.companyId || req.user?.userCompanyId;

    if (!userCompanyId) {
      return res.status(400).json({
        success: false,
        message: 'Company ID is required',
      });
    }

    const bill = await Bill.findOne({
      where: { id, userCompanyId },
    });

    if (!bill) {
      return res.status(404).json({
        success: false,
        message: 'Bill not found',
      });
    }

    await BillItem.destroy({ where: { billId: bill.id } });
    await bill.destroy();

    res.status(200).json({
      success: true,
      message: 'Bill deleted successfully',
    });
  } catch (error) {
    console.error('Error deleting bill:', error);
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

/**
 * Record payment for a bill
 */
const recordPayment = async (req, res) => {
  try {
    const { id } = req.params;
    const { paidAmount } = req.body;
    const userCompanyId = req.companyId || req.user?.userCompanyId;
    const userId = req.user?.id;

    if (!userCompanyId) {
      return res.status(400).json({
        success: false,
        message: 'Company ID is required',
      });
    }

    if (!paidAmount || parseFloat(paidAmount) <= 0) {
      return res.status(400).json({
        success: false,
        message: 'Valid paid amount is required',
      });
    }

    const bill = await Bill.findOne({
      where: { id, userCompanyId },
    });

    if (!bill) {
      return res.status(404).json({
        success: false,
        message: 'Bill not found',
      });
    }

    const newPaidAmount = parseFloat(bill.paidAmount || 0) + parseFloat(paidAmount);
    const dueAmount = Math.max(0, parseFloat(bill.totalAmount) - newPaidAmount);

    await bill.update({
      paidAmount: newPaidAmount,
      dueAmount,
      paymentStatus: BillCalculationService.getPaymentStatus(bill.totalAmount, newPaidAmount),
      updatedBy: userId,
    });

    res.status(200).json({
      success: true,
      message: 'Payment recorded successfully',
      data: bill,
    });
  } catch (error) {
    console.error('Error recording payment:', error);
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

/**
 * Change bill status
 */
const changeBillStatus = async (req, res) => {
  try {
    const { id } = req.params;
    const { status } = req.body;
    const userCompanyId = req.companyId || req.user?.userCompanyId;
    const userId = req.user?.id;

    if (!userCompanyId) {
      return res.status(400).json({
        success: false,
        message: 'Company ID is required',
      });
    }

    const validStatuses = ['Draft', 'Paid', 'Pending', 'Cancelled'];
    if (!validStatuses.includes(status)) {
      return res.status(400).json({
        success: false,
        message: `Invalid status. Must be one of: ${validStatuses.join(', ')}`,
      });
    }

    const bill = await Bill.findOne({
      where: { id, userCompanyId },
    });

    if (!bill) {
      return res.status(404).json({
        success: false,
        message: 'Bill not found',
      });
    }

    await bill.update({
      status,
      updatedBy: userId,
    });

    res.status(200).json({
      success: true,
      message: 'Bill status updated successfully',
      data: bill,
    });
  } catch (error) {
    console.error('Error changing bill status:', error);
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

/**
 * Create quick sale (POS) - simplified bill creation for counter sales
 */
const createQuickSale = async (req, res) => {
  try {
    const { 
      items, 
      billDiscountPercent = 0, 
      cgstPercent = 0, 
      sgstPercent = 0,
      paymentMethod = 'cash',
      receivedAmount = 0,
      customerName = 'Cash Patient',
      customerId = null,
      ...billData 
    } = req.body;
    
    const userCompanyId = req.companyId || req.user?.userCompanyId;
    const userId = req.user?.id;

    if (!userCompanyId) {
      return res.status(400).json({
        success: false,
        message: 'Company ID is required',
      });
    }

    if (!items || items.length === 0) {
      return res.status(400).json({
        success: false,
        message: 'At least one item is required',
      });
    }

    // Validate bill data
    BillCalculationService.validateBillData({ ...billData, items });

    // Generate bill number if not provided
    if (!billData.billNo) {
      billData.billNo = await generateBillNumber(userCompanyId);
    }

    // Calculate totals with proper tax structure
    const calculations = BillCalculationService.calculateBillTotals(
      items || [],
      billDiscountPercent,
      {
        igstPercent: 0,
        cgstPercent,
        sgstPercent,
        cessPercent: 0,
      }
    );

    const totalAmount = calculations.totalAmount;
    const paidAmount = parseFloat(receivedAmount) || 0;
    const dueAmount = Math.max(0, totalAmount - paidAmount);
    const paymentStatus = BillCalculationService.getPaymentStatus(totalAmount, paidAmount);
    const status = paymentStatus === 'Paid' ? 'Paid' : 'Pending';

    // Create bill with calculated values
    const bill = await Bill.create({
      ...billData,
      userCompanyId,
      createdBy: userId,
      updatedBy: userId,
      partyName: customerName,
      partyId: customerId,
      patientName: customerName,
      patientId: customerId,
      paymentMethod,
      receivedAmount: paidAmount,
      ...calculations,
      paidAmount,
      dueAmount,
      paymentStatus,
      status,
    });

    // Create bill items
    if (items && items.length) {
      for (const item of calculations.items) {
        await BillItem.create({
          ...item,
          billId: bill.id,
        });
      }
    }

    const fullBill = await Bill.findByPk(bill.id, {
      include: [{ model: BillItem, as: 'billItems' }],
    });

    res.status(201).json({
      success: true,
      message: 'Quick sale completed successfully',
      data: fullBill,
    });
  } catch (error) {
    console.error('Error creating quick sale:', error);
    res.status(400).json({
      success: false,
      message: error.message,
    });
  }
};

/**
 * Get held bills (Draft status)
 */
const getHeldBills = async (req, res) => {
  try {
    const userCompanyId = req.companyId || req.user?.userCompanyId;
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 20;
    const offset = (page - 1) * limit;

    if (!userCompanyId) {
      return res.status(400).json({
        success: false,
        message: 'Company ID is required',
      });
    }

    const where = { 
      userCompanyId, 
      status: 'Draft' 
    };

    const { count, rows } = await Bill.findAndCountAll({
      where,
      offset,
      limit,
      order: [['createdAt', 'DESC']],
      include: [{ model: BillItem, as: 'billItems' }],
      raw: false,
    });

    res.status(200).json({
      success: true,
      data: rows,
      total: count,
      page,
      totalPages: Math.ceil(count / limit),
    });
  } catch (error) {
    console.error('Error fetching held bills:', error);
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

/**
 * Hold a bill (save as Draft)
 */
const holdBill = async (req, res) => {
  try {
    const { 
      items, 
      billDiscountPercent = 0, 
      cgstPercent = 0, 
      sgstPercent = 0,
      customerName = 'Cash Patient',
      customerId = null,
      ...billData 
    } = req.body;
    
    const userCompanyId = req.companyId || req.user?.userCompanyId;
    const userId = req.user?.id;

    if (!userCompanyId) {
      return res.status(400).json({
        success: false,
        message: 'Company ID is required',
      });
    }

    if (!items || items.length === 0) {
      return res.status(400).json({
        success: false,
        message: 'At least one item is required',
      });
    }

    BillCalculationService.validateBillData({ ...billData, items });

    if (!billData.billNo) {
      billData.billNo = await generateBillNumber(userCompanyId);
    }

    const calculations = BillCalculationService.calculateBillTotals(
      items || [],
      billDiscountPercent,
      {
        igstPercent: 0,
        cgstPercent,
        sgstPercent,
        cessPercent: 0,
      }
    );

    const bill = await Bill.create({
      ...billData,
      userCompanyId,
      createdBy: userId,
      updatedBy: userId,
      partyName: customerName,
      partyId: customerId,
      patientName: customerName,
      patientId: customerId,
      ...calculations,
      paidAmount: 0,
      dueAmount: calculations.totalAmount,
      paymentStatus: 'Unpaid',
      status: 'Draft',
    });

    if (items && items.length) {
      for (const item of calculations.items) {
        await BillItem.create({
          ...item,
          billId: bill.id,
        });
      }
    }

    const fullBill = await Bill.findByPk(bill.id, {
      include: [{ model: BillItem, as: 'billItems' }],
    });

    res.status(201).json({
      success: true,
      message: 'Bill held successfully',
      data: fullBill,
    });
  } catch (error) {
    console.error('Error holding bill:', error);
    res.status(400).json({
      success: false,
      message: error.message,
    });
  }
};

/**
 * Release held bill (convert Draft to active)
 */
const releaseHeldBill = async (req, res) => {
  try {
    const { id } = req.params;
    const { paymentMethod = 'cash', receivedAmount = 0 } = req.body;
    const userCompanyId = req.companyId || req.user?.userCompanyId;
    const userId = req.user?.id;

    if (!userCompanyId) {
      return res.status(400).json({
        success: false,
        message: 'Company ID is required',
      });
    }

    const bill = await Bill.findOne({
      where: { id, userCompanyId, status: 'Draft' },
      include: [{ model: BillItem, as: 'billItems' }],
    });

    if (!bill) {
      return res.status(404).json({
        success: false,
        message: 'Held bill not found',
      });
    }

    const paidAmount = parseFloat(receivedAmount) || 0;
    const dueAmount = Math.max(0, parseFloat(bill.totalAmount) - paidAmount);
    const paymentStatus = BillCalculationService.getPaymentStatus(bill.totalAmount, paidAmount);
    const status = paymentStatus === 'Paid' ? 'Paid' : 'Pending';

    await bill.update({
      status,
      paymentMethod,
      receivedAmount: paidAmount,
      paidAmount,
      dueAmount,
      paymentStatus,
      updatedBy: userId,
    });

    const updatedBill = await Bill.findByPk(bill.id, {
      include: [{ model: BillItem, as: 'billItems' }],
    });

    res.status(200).json({
      success: true,
      message: 'Bill released successfully',
      data: updatedBill,
    });
  } catch (error) {
    console.error('Error releasing held bill:', error);
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

/**
 * Get printable bill format
 */
const getPrintableBill = async (req, res) => {
  try {
    const { id } = req.params;
    const userCompanyId = req.companyId || req.user?.userCompanyId;

    if (!userCompanyId) {
      return res.status(400).json({
        success: false,
        message: 'Company ID is required',
      });
    }

    const bill = await Bill.findOne({
      where: { id, userCompanyId },
      include: [{ model: BillItem, as: 'billItems' }],
    });

    if (!bill) {
      return res.status(404).json({
        success: false,
        message: 'Bill not found',
      });
    }

    // Format for printing
    const printData = {
      billNo: bill.billNo,
      date: bill.date,
      customerName: bill.partyName || bill.patientName || 'Cash Patient',
      customerAddress: bill.address,
      items: bill.billItems?.map(item => ({
        name: item.productname,
        batch: item.batch,
        expiry: item.expDate,
        qty: item.quantity,
        rate: item.rate,
        discount: item.discountPercent,
        amount: item.amount,
        gst: {
          igst: item.igstPercent,
          cgst: item.cgstPercent,
          sgst: item.sgstPercent,
          cess: item.cessPercent,
        }
      })) || [],
      subtotal: bill.subtotal,
      discount: bill.billDiscountAmount,
      tax: bill.totalTaxAmount,
      total: bill.totalAmount,
      paid: bill.paidAmount,
      due: bill.dueAmount,
      paymentMethod: bill.paymentMethod,
      paymentStatus: bill.paymentStatus,
    };

    res.status(200).json({
      success: true,
      data: printData,
    });
  } catch (error) {
    console.error('Error getting printable bill:', error);
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

/**
 * Get today's sales summary
 */
const getTodaySummary = async (req, res) => {
  try {
    const userCompanyId = req.companyId || req.user?.userCompanyId;
    const todayStart = new Date().toISOString().split('T')[0];
    const todayEnd = new Date(new Date().getTime() + 24 * 60 * 60 * 1000).toISOString().split('T')[0];

    if (!userCompanyId) {
      return res.status(400).json({
        success: false,
        message: 'Company ID is required',
      });
    }

    const where = { 
      userCompanyId,
      date: {
        [Op.gte]: todayStart,
        [Op.lt]: todayEnd,
      }
    };

    const bills = await Bill.findAll({
      where,
      attributes: ['totalAmount', 'paidAmount', 'paymentStatus', 'status', 'paymentMethod'],
    });

    const summary = {
      totalBills: bills.length,
      totalSales: bills.reduce((sum, b) => sum + parseFloat(b.totalAmount || 0), 0),
      totalPaid: bills.reduce((sum, b) => sum + parseFloat(b.paidAmount || 0), 0),
      totalDue: bills.reduce((sum, b) => sum + Math.max(0, parseFloat(b.totalAmount || 0) - parseFloat(b.paidAmount || 0)), 0),
      byPaymentMethod: {},
      byStatus: {}
    };

    bills.forEach(bill => {
      const method = bill.paymentMethod || 'cash';
      summary.byPaymentMethod[method] = (summary.byPaymentMethod[method] || 0) + parseFloat(bill.totalAmount || 0);
      
      const status = bill.status || 'Unknown';
      summary.byStatus[status] = (summary.byStatus[status] || 0) + 1;
    });

    res.status(200).json({
      success: true,
      data: summary,
    });
  } catch (error) {
    console.error('Error getting today summary:', error);
    res.status(500).json({
      success: false,
      message: error.message,
    });
  }
};

module.exports = {
  createBill,
  getAllBills,
  getBillById,
  updateBill,
  deleteBill,
  recordPayment,
  changeBillStatus,
  createQuickSale,
  getHeldBills,
  holdBill,
  releaseHeldBill,
  getPrintableBill,
  getTodaySummary,
};
