#!/usr/bin/env node
/**
 * Database Initialization Script
 * Checks if database exists, creates it if not, then runs migrations and seeds
 */

// checking if worflow is working fine or not

const { Client } = require('pg');
const { execSync } = require('child_process');
const path = require('path');

// Load environment variables
require('dotenv').config({ path: path.join(__dirname, '..', '.env') });

// Database configuration
const config = {
  user: process.env.DB_USER || 'postgres',
  password: process.env.DB_PASSWORD || 'postgres',
  host: process.env.DB_HOST || 'localhost',
  port: process.env.DB_PORT || 5432,
  database: 'postgres', // Connect to default postgres db first
};

const targetDatabase = process.env.DB_NAME || 'pharmacydb';

async function checkDatabaseExists(client, dbName) {
  const result = await client.query(
    `SELECT 1 FROM pg_database WHERE datname = $1`,
    [dbName]
  );
  return result.rows.length > 0;
}

async function createDatabase(client, dbName) {
  console.log(`📦 Creating database "${dbName}"...`);
  await client.query(`CREATE DATABASE "${dbName}"`);
  console.log(`✅ Database "${dbName}" created successfully!`);
}

async function runMigrations() {
  console.log('\n🔄 Running migrations...');
  try {
    execSync('npm run migrate', { 
      stdio: 'inherit',
      cwd: path.join(__dirname, '..')
    });
    console.log('✅ Migrations completed successfully!');
  } catch (error) {
    console.error('❌ Migration failed:', error.message);
    process.exit(1);
  }
}

async function runSeeders() {
  console.log('\n🌱 Running seeders...');
  try {
    execSync('npm run seed', { 
      stdio: 'inherit',
      cwd: path.join(__dirname, '..')
    });
    console.log('✅ Seeders completed successfully!');
  } catch (error) {
    console.error('❌ Seeding failed:', error.message);
    process.exit(1);
  }
}

async function main() {
  console.log('🚀 ASR Pharma - Database Initialization\n');
  console.log(`📍 Host: ${config.host}:${config.port}`);
  console.log(`📍 Target Database: ${targetDatabase}`);
  console.log(`📍 User: ${config.user}\n`);

  const client = new Client(config);

  try {
    await client.connect();
    console.log('✅ Connected to PostgreSQL server');

    const exists = await checkDatabaseExists(client, targetDatabase);

    if (exists) {
      console.log(`✅ Database "${targetDatabase}" already exists`);
    } else {
      await createDatabase(client, targetDatabase);
    }

    await client.end();

    // Run migrations and seeders
    await runMigrations();
    await runSeeders();

    console.log('\n🎉 Database initialization complete!');
    console.log('\n📝 Default credentials:');
    console.log('   Username: admin');
    console.log('   Password: Admin@123');
    console.log('\n🚀 Start the server with: npm run dev');

  } catch (error) {
    console.error('\n❌ Initialization failed:', error.message);
    
    if (error.code === 'ECONNREFUSED') {
      console.error('\n💡 Make sure PostgreSQL is running:');
      console.error('   sudo systemctl start postgresql');
    } else if (error.code === '28P01') {
      console.error('\n💡 Authentication failed. Check your credentials in .env file');
    }
    
    process.exit(1);
  }
}

main();
