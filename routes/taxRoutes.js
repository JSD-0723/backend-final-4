const express = require('express');
const router = express.Router();
const { validate } = require('../middleware/validate');
const { taxValidator } = require('../validators');

const {
  createTax,
  getTaxes,
  getTax,
  updateTax,
  deleteTax,
} = require('../controllers/taxController');

router.get('/', getTaxes);
router.get('/:id', getTax);
router.post('/', taxValidator.rules(), validate, createTax);
router.put('/:id', taxValidator.optionalRules(), validate, updateTax);
router.delete('/:id', deleteTax);

module.exports = router;
