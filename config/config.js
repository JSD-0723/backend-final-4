const process = require('process');
require('dotenv').config();

module.exports = {
  development: {
    username: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    host: process.env.DB_HOST,
    dialect: 'mysql',
    jwt_secret: process.env.JWT_SECRET,
    // logging: false,
    deliveryFee: 12,
    itemsPerPage: 20,
    newArrivalMonths: 3,
    handPickedRating: 4.5,
    handPickedPrice: 100,
  },

  test: {
    username: process.env.TEST_DB_USER,
    password: process.env.TEST_DB_PASSWORD,
    database: process.env.TEST_DB_NAME,
    host: process.env.TEST_DB_HOST,
    dialect: 'mysql',
    jwt_secret: process.env.TEST_JWT_SECRET,
    logging: false,
    charset: 'utf8mb4',
    deliveryFee: 12,
    itemsPerPage: 20,
    newArrivalMonths: 3,
    handPickedRating: 4.5,
    handPickedPrice: 100,
  },
};
