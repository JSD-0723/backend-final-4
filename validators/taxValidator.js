// Import necessary modules
const { body } = require('express-validator');

// Tax Validation Rules
const taxValidationRules = () => {
  return [
    body('countryCode', 'Country code must be a non-empty string with a maximum length of 2 characters')
      .isString()
      .notEmpty()
      .isLength({ max: 2 }),
    body('countryName', 'Country name must be a non-empty string with a maximum length of 50 characters')
      .isString()
      .notEmpty()
      .isLength({ max: 50 }),
    body('taxRate', 'Tax rate must be a non-empty number')
      .isNumeric()
      .notEmpty(),
  ];
};

// Tax Validation Optional Rules
const taxOptionalRules = () => {
  return [
    body('countryCode', 'Country code must be a non-empty string with a maximum length of 2 characters')
      .optional()
      .isString()
      .notEmpty()
      .isLength({ max: 2 }),
    body('countryName', 'Country name must be a non-empty string with a maximum length of 50 characters')
      .optional()
      .isString()
      .notEmpty()
      .isLength({ max: 50 }),
    body('taxRate', 'Tax rate must be a non-empty number')
      .optional()
      .isNumeric()
      .notEmpty(),
  ];
};

// Export the Tax Validation Rules
module.exports = {
  rules: taxValidationRules,
  optionalRules: taxOptionalRules,
};
