const { DataTypes } = require('sequelize');
const sequelize = require('../utils/dataBaseConnection'); 

const Tax = sequelize.define('tax', {
  id: {
    type: DataTypes.INTEGER,
    allowNull: false,
    autoIncrement: true,
    primaryKey: true,
  },
  countryCode: {
    type: DataTypes.STRING(2), 
    allowNull: false,
  },
  countryName: {
    type: DataTypes.STRING(50),
    allowNull: false,
  },
  taxRate: {
    type: DataTypes.DECIMAL(10, 2), 
    allowNull: false,
  },
}, {
  freezeTableName: true,
  timestamps: false,
});


module.exports = Tax;
