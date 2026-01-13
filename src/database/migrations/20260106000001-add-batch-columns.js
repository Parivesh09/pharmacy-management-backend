'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    await queryInterface.addColumn('batches', 'unit1st', {
      type: Sequelize.STRING,
      allowNull: true,
      comment: 'Primary unit for the batch'
    });

    await queryInterface.addColumn('batches', 'billingMrp', {
      type: Sequelize.DECIMAL(10, 2),
      allowNull: true,
      comment: 'Billing MRP for the batch'
    });

    await queryInterface.addColumn('batches', 'mfgDate', {
      type: Sequelize.DATEONLY,
      allowNull: true,
      comment: 'Manufacturing date of the batch'
    });

    await queryInterface.addColumn('batches', 'closingQty', {
      type: Sequelize.DECIMAL(10, 2),
      allowNull: true,
      defaultValue: 0,
      comment: 'Closing quantity (calculated field)'
    });

    // Add index for better performance
    await queryInterface.addIndex('batches', ['mfgDate'], {
      name: 'idx_batches_mfg_date'
    });

    await queryInterface.addIndex('batches', ['expiryDate'], {
      name: 'idx_batches_expiry_date'
    });
  },

  down: async (queryInterface, Sequelize) => {
    await queryInterface.removeIndex('batches', 'idx_batches_expiry_date');
    await queryInterface.removeIndex('batches', 'idx_batches_mfg_date');
    
    await queryInterface.removeColumn('batches', 'closingQty');
    await queryInterface.removeColumn('batches', 'mfgDate');
    await queryInterface.removeColumn('batches', 'billingMrp');
    await queryInterface.removeColumn('batches', 'unit1st');
  }
};