/* eslint-disable no-undef */
const { createAddress } = require('../../controllers/addressController');
const { Address } = require('../../models');
const { createCustomError } = require('../../utils/errors/custom-error');

describe('createAddress', () => {
  it('should create a new address and return success response', async () => {
    const mockRequestBody = {
      street: '456 Oak St',
      postalCode: '12345',
      state: 'CA',
      city: 'San Francisco',
      userId: 2,
    };

    Address.findOne = jest.fn().mockResolvedValue(null);
    Address.create = jest.fn().mockResolvedValue({ id: 2, ...mockRequestBody });

    const req = { body: mockRequestBody };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await createAddress(req, res, next);

    expect(Address.findOne).toHaveBeenCalledWith({
      where: {
        street: mockRequestBody.street,
        postalCode: mockRequestBody.postalCode,
        state: mockRequestBody.state,
        city: mockRequestBody.city,
        userId: mockRequestBody.userId,
      },
    });

    expect(Address.create).toHaveBeenCalledWith(mockRequestBody);

    expect(res.status).toHaveBeenCalledWith(201);
    expect(res.json).toHaveBeenCalledWith({
      success: true,
      message: 'Address created successfully',
      data: { id: 2, ...mockRequestBody },
    });

    expect(next).not.toHaveBeenCalled();
  });

  it('should invoke the next middleware with a custom error if address already exists', async () => {
    const mockRequestBody = {
      street: '456 Oak St',
      postalCode: '12345',
      state: 'CA',
      city: 'San Francisco',
      userId: 2,
    };

    Address.findOne = jest.fn().mockResolvedValue({ id: 1, ...mockRequestBody });

    const req = { body: mockRequestBody };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await createAddress(req, res, next);

    expect(Address.findOne).toHaveBeenCalledWith({
      where: {
        street: mockRequestBody.street,
        postalCode: mockRequestBody.postalCode,
        state: mockRequestBody.state,
        city: mockRequestBody.city,
        userId: mockRequestBody.userId,
      },
    });

    // expect(Address.create).not.toHaveBeenCalled();

    expect(next).toHaveBeenCalledWith(createCustomError('Address already exists', 400));
    expect(res.status).not.toHaveBeenCalled();
    expect(res.json).not.toHaveBeenCalled();
  });
});