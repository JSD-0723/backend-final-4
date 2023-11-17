const { Tax } = require('../models');
const { asyncWrapper } = require('../middleware');
const { createCustomError } = require('../utils/errors/custom-error');

const createTax = asyncWrapper(async (req, res, next) => {
  const { countryCode, countryName, taxRate } = req.body;

  const existingTax = await Tax.findOne({
    where: {
      countryCode,
    },
  });

  if (existingTax) {
    return next(createCustomError('Tax for this country already exists', 400));
  }

  const tax = await Tax.create({
    countryCode,
    countryName,
    taxRate,
  });

  res.status(201).json({
    success: true,
    message: 'Tax created successfully',
    data: tax,
  });
});

const getTaxes = asyncWrapper(async (req, res) => {
  const taxes = await Tax.findAll();

  res.status(200).json({
    success: true,
    message: 'Taxes fetched successfully',
    data: taxes,
  });
});

const getTax = asyncWrapper(async (req, res, next) => {
  const id = Number(req.params.id);
  const tax = await Tax.findByPk(id);

  if (!tax) {
    return next(createCustomError(`No tax with ID: ${id} found`, 404));
  }

  res.status(200).json({
    success: true,
    message: 'Tax fetched successfully',
    data: tax,
  });
});

const updateTax = asyncWrapper(async (req, res, next) => {
  const id = Number(req.params.id);
  const { countryCode, countryName, taxRate } = req.body;

  const tax = await Tax.findByPk(id);

  if (!tax) {
    return next(createCustomError(`No tax with ID: ${id} found`, 404));
  }

  tax.countryCode = countryCode;
  tax.countryName = countryName;
  tax.taxRate = taxRate;
  await tax.save();

  res.status(200).json({
    success: true,
    message: 'Tax updated successfully',
    data: tax,
  });
});

const deleteTax = asyncWrapper(async (req, res, next) => {
  const id = Number(req.params.id);
  const tax = await Tax.findByPk(id);

  if (!tax) {
    return next(createCustomError(`No tax with ID: ${id} found`, 404));
  }

  await tax.destroy();

  res.status(200).json({
    success: true,
    message: 'Tax deleted successfully',
  });
});

module.exports = {
  createTax,
  getTaxes,
  getTax,
  updateTax,
  deleteTax,
};
