const db = require("./src/database/index");
const sequelize = db.sequelize;

async function checkSchema() {
  try {
    const [results, metadata] = await sequelize.query(
      "SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'Bills'"
    );
    console.log("Columns in Bills table:");
    console.log(results);
    
    const [results2, metadata2] = await sequelize.query(
        "SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'bills'"
      );
      console.log("Columns in bills table (lowercase):");
      console.log(results2);
      
    process.exit(0);
  } catch (error) {
    console.error("Error checking schema:", error);
    process.exit(1);
  }
}

checkSchema();
