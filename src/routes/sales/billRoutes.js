const express = require('express');
const router = express.Router();
const BillController = require('../../controllers/sales/BillController');

/**
 * @swagger
 * /pharmacy/sales/bills/v1:
 *   get:
 *     tags:
 *       - Sales - Bills
 *     summary: Get all bills
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: List of bills
 */
router.get('/', BillController.getAllBills);
/**
 * @swagger
 * /pharmacy/sales/bills/v1/{id}:
 *   get:
 *     tags:
 *       - Sales - Bills
 *     summary: Get bill by ID
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: Bill details
 *   put:
 *     tags:
 *       - Sales - Bills
 *     summary: Update bill
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *     responses:
 *       200:
 *         description: Bill updated successfully
 *   delete:
 *     tags:
 *       - Sales - Bills
 *     summary: Delete bill
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: Bill deleted successfully
 */
router.get('/:id', BillController.getBillById);

/**
 * @swagger
 * /pharmacy/sales/bills/v1:
 *   post:
 *     tags:
 *       - Sales - Bills
 *     summary: Create bill
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *     responses:
 *       201:
 *         description: Bill created successfully
 */
router.post('/', BillController.createBill);
router.put('/:id', BillController.updateBill);
router.delete('/:id', BillController.deleteBill);

/**
 * @swagger
 * /pharmacy/sales/bills/v1/{id}/payment:
 *   post:
 *     tags:
 *       - Sales - Bills
 *     summary: Record payment
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *     responses:
 *       200:
 *         description: Payment recorded successfully
 */
router.post('/:id/payment', BillController.recordPayment);

/**
 * @swagger
 * /pharmacy/sales/bills/v1/{id}/status:
 *   patch:
 *     tags:
 *       - Sales - Bills
 *     summary: Change bill status
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *     responses:
 *       200:
 *         description: Bill status updated successfully
 */
router.patch('/:id/status', BillController.changeBillStatus);

/**
 * @swagger
 * /pharmacy/sales/bills/v1/quick-sale:
 *   post:
 *     tags:
 *       - Sales - POS
 *     summary: Create quick sale (POS)
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *     responses:
 *       201:
 *         description: Quick sale created successfully
 */
router.post('/quick-sale', BillController.createQuickSale);

/**
 * @swagger
 * /pharmacy/sales/bills/v1/held:
 *   get:
 *     tags:
 *       - Sales - POS
 *     summary: Get held bills
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: List of held bills
 */
router.get('/held', BillController.getHeldBills);

/**
 * @swagger
 * /pharmacy/sales/bills/v1/hold:
 *   post:
 *     tags:
 *       - Sales - POS
 *     summary: Hold a bill
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *     responses:
 *       201:
 *         description: Bill held successfully
 */
router.post('/hold', BillController.holdBill);

/**
 * @swagger
 * /pharmacy/sales/bills/v1/{id}/release-hold:
 *   post:
 *     tags:
 *       - Sales - POS
 *     summary: Release held bill
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: Held bill released successfully
 */
router.post('/:id/release-hold', BillController.releaseHeldBill);

/**
 * @swagger
 * /pharmacy/sales/bills/v1/{id}/print:
 *   get:
 *     tags:
 *       - Sales - POS
 *     summary: Get printable bill format
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - name: id
 *         in: path
 *         required: true
 *         schema:
 *           type: string
 *     responses:
 *       200:
 *         description: Printable bill data
 */
router.get('/:id/print', BillController.getPrintableBill);

/**
 * @swagger
 * /pharmacy/sales/bills/v1/summary/today:
 *   get:
 *     tags:
 *       - Sales - POS
 *     summary: Get today's sales summary
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Today's sales summary
 */
router.get('/summary/today', BillController.getTodaySummary);

// Legacy routes for backward compatibility
router.get('/get-bills', BillController.getAllBills);
router.get('/get-bill/:id', BillController.getBillById);
router.post('/add-bill', BillController.createBill);
router.put('/update-bill/:id', BillController.updateBill);
router.delete('/delete-bill/:id', BillController.deleteBill);

module.exports = router; 
