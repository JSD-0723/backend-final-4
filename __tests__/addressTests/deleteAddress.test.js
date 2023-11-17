/* eslint-disable no-undef */
const { deleteAddress } = require('../../controllers/addressController');
const { Address } = require('../../models');
const { createCustomError } = require('../../utils/errors/custom-error');

describe('deleteAddress', () => {
  it('should delete the address and return success response', async () => {
    const mockAddressId = 1;
    const mockDeletedRowCount = 1;

    Address.destroy = jest.fn().mockResolvedValue(mockDeletedRowCount);

    const req = { params: { id: mockAddressId } };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await deleteAddress(req, res, next);

    expect(Address.destroy).toHaveBeenCalledWith({ where: { id: mockAddressId } });

    expect(res.status).toHaveBeenCalledWith(200);
    expect(res.json).toHaveBeenCalledWith({
      success: true,
      message: 'Address deleted successfully',
    });

    expect(next).not.toHaveBeenCalled();
  });

  it('should invoke the next middleware with a custom error if address is not found', async () => {
    const mockAddressId = 1;
    const mockDeletedRowCount = 0;

    Address.destroy = jest.fn().mockResolvedValue(mockDeletedRowCount);

    const req = { params: { id: mockAddressId } };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await deleteAddress(req, res, next);

    expect(Address.destroy).toHaveBeenCalledWith({ where: { id: mockAddressId } });

    expect(next).toHaveBeenCalledWith(createCustomError(`No address with id: ${mockAddressId} is found`, 404));
    expect(res.status).not.toHaveBeenCalled();
    expect(res.json).not.toHaveBeenCalled();
  });
});
