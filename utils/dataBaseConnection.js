const { Sequelize } = require('sequelize');
const config = require('../config/config');
const process = require('process');


const environment = process.env.NODE_ENV || 'development';
const isTestEnvironment = environment === 'test';

const sequelize = new Sequelize(config[environment]);

if (!isTestEnvironment) {
  sequelize
    .sync({ force: false })
    .then(() => {
      sequelize
        .authenticate()
        .then(() => {
          console.log('Database connection has been established successfully.');
        })
        .catch((error) => {
          console.error('Unable to authenticate with the database:', error);
        });
    })
    .catch((error) => {
      console.error('Unable to synchronize the database:', error);
    });
}

module.exports = sequelize;
