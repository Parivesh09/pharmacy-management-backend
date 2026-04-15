'use strict';

module.exports = {
  up: async (queryInterface, Sequelize) => {
    const transaction = await queryInterface.sequelize.transaction();
    try {
      // List of tables that should have userCompanyId
      const tables = [
        { name: 'Bills', model: 'user_companies' },
        { name: 'BillItems', model: 'user_companies' },
        { name: 'items', model: 'user_companies' },
        { name: 'stores', model: 'user_companies' },
        { name: 'racks', model: 'user_companies' },
        { name: 'units', model: 'user_companies' },
        { name: 'salts', model: 'user_companies' },
        { name: 'manufacturers', model: 'user_companies' },
        { name: 'doctors', model: 'user_companies' },
        { name: 'patients', model: 'user_companies' },
        { name: 'prescriptions', model: 'user_companies' },
        { name: 'stations', model: 'user_companies' }
      ];

      for (const table of tables) {
        const tableInfo = await queryInterface.describeTable(table.name).catch(() => null);
        if (tableInfo && !tableInfo.userCompanyId) {
          console.log(`Adding userCompanyId to ${table.name}`);
          await queryInterface.addColumn(table.name, 'userCompanyId', {
            type: Sequelize.UUID,
            allowNull: true, // Initially allow null for migration safety
            references: {
              model: table.model || 'user_companies',
              key: 'id'
            },
            onUpdate: 'CASCADE',
            onDelete: 'CASCADE'
          }, { transaction });
        }
      }

      await transaction.commit();
    } catch (error) {
      await transaction.rollback();
      console.error('Migration failed:', error);
      throw error;
    }
  },

  down: async (queryInterface, Sequelize) => {
    // We don't necessarily want to remove these columns in a rollback if they are critical
    // but for completeness:
    const tables = ['Bills', 'BillItems', 'items', 'stores', 'racks', 'units', 'salts', 'manufacturers', 'doctors', 'patients', 'prescriptions', 'stations'];
    for (const table of tables) {
       try {
         await queryInterface.removeColumn(table, 'userCompanyId');
       } catch (e) {
         // Ignore if column doesn't exist
       }
    }
  }
};
