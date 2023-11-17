/* eslint-disable no-unused-vars */
'use strict';

const { Tax } = require('../models');
const { taxData } = require('../utils/constants');

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    return await Promise.all(taxData.map(async data => {
      try {
        await Tax.findOrCreate({
          where: { countryCode: data.countryCode },
          defaults: data,
        });
      } catch (error) {
        console.error(error);
      }
    }));
  },

  async down(queryInterface, Sequelize) {
    return await queryInterface.bulkDelete('Tax', null, {});
  }
};
