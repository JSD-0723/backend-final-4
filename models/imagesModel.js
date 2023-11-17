const DataTypes = require('sequelize');
const sequelize = require('../utils/dataBaseConnection');
const Product = require('./productModel');

const Image = sequelize.define('image', {
    id: {
        type: DataTypes.INTEGER(15),
        allowNull: false,
        autoIncrement: true,
        primaryKey: true
    },
    imageUrl: {
        type: DataTypes.STRING(255),
        allowNull: false,
        validate: {
            notEmpty: {
                msg: 'Image URL cannot be empty',
            },
            isURL: {
                msg: 'Invalid URL format',
            },
        },
    },
    productId: {
        type: DataTypes.INTEGER(15),
        allowNull: false,
        references: {
            model: Product,
            key: 'id',
            onDelete: 'CASCADE',
        },
    },
}, {
    freezeTableName: true,
    timestamps: false,
});

// Associations
Image.belongsTo(Product, { onDelete: 'cascade', hooks: true }, { foreignKey: 'productId' });
Product.hasMany(Image, { foreignKey: 'productId' });


module.exports = Image;
