/* eslint-disable no-undef */
const { getAddress } = require('../../controllers/addressController');
const { Address } = require('../../models');
const { createCustomError } = require('../../utils/errors/custom-error');

describe('getAddress', () => {
  it('should return the address if found', async () => {
    Address.findByPk = jest.fn().mockResolvedValue({ id: 1, street: '123 Main St' });

    const req = { params: { id: 1 } };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await getAddress(req, res, next);

    expect(res.status).toHaveBeenCalledWith(200);
    expect(res.json).toHaveBeenCalledWith({
      success: true,
      message: 'Address fetched successfully',
      data: { id: 1, street: '123 Main St' },
    });
    expect(next).not.toHaveBeenCalled();
  });

  it('should invoke the next middleware with a custom error if address is not found', async () => {
    Address.findByPk = jest.fn().mockResolvedValue(null);

    const req = { params: { id: 1 } };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await getAddress(req, res, next);

    expect(next).toHaveBeenCalledWith(createCustomError('No address with id: 1 is found', 404));
    expect(res.status).not.toHaveBeenCalled();
    expect(res.json).not.toHaveBeenCalled();
  });
});