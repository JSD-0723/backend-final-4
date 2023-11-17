/* eslint-disable no-undef */
const { updateAddress } = require('../../controllers/addressController');
const { Address } = require('../../models');
const { createCustomError } = require('../../utils/errors/custom-error');

describe('updateAddress', () => {
  it('should update the address and return success response', async () => {
    const mockAddressId = 1;
    const mockRequestBody = {
      street: '789 Elm St',
      postalCode: '67890',
      state: 'NY',
      city: 'New York',
      userId: 3,
    };
    const mockUpdatedRowCount = 1;
    const mockUpdatedAddress = { id: mockAddressId, ...mockRequestBody };

    Address.findOne = jest.fn().mockResolvedValue(null);
    Address.update = jest.fn().mockResolvedValue([mockUpdatedRowCount]);
    Address.findByPk = jest.fn().mockResolvedValue(mockUpdatedAddress);

    const req = { params: { id: mockAddressId }, body: mockRequestBody };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await updateAddress(req, res, next);

    expect(Address.findOne).toHaveBeenCalledWith({
      where: {
        street: mockRequestBody.street,
        postalCode: mockRequestBody.postalCode,
        state: mockRequestBody.state,
        city: mockRequestBody.city,
        userId: mockRequestBody.userId,
      },
    });

    expect(Address.update).toHaveBeenCalledWith(
      {
        street: mockRequestBody.street,
        postalCode: mockRequestBody.postalCode,
        state: mockRequestBody.state,
        city: mockRequestBody.city,
        userId: mockRequestBody.userId,
      },
      { where: { id: mockAddressId } }
    );

    expect(Address.findByPk).toHaveBeenCalledWith(mockAddressId);

    expect(res.status).toHaveBeenCalledWith(200);
    expect(res.json).toHaveBeenCalledWith({
      success: true,
      message: 'Address updated successfully',
      data: mockUpdatedAddress,
    });

    expect(next).not.toHaveBeenCalled();
  });

  it('should invoke the next middleware with a custom error if address is not found for update', async () => {
    const mockAddressId = 1;
    const mockRequestBody = {
      street: '789 Elm St',
      postalCode: '67890',
      state: 'NY',
      city: 'New York',
      userId: 3,
    };
    const mockUpdatedRowCount = 0;

    Address.findOne = jest.fn().mockResolvedValue(null);
    Address.update = jest.fn().mockResolvedValue([mockUpdatedRowCount]);

    const req = { params: { id: mockAddressId }, body: mockRequestBody };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await updateAddress(req, res, next);

    expect(Address.findOne).toHaveBeenCalledWith({
      where: {
        street: mockRequestBody.street,
        postalCode: mockRequestBody.postalCode,
        state: mockRequestBody.state,
        city: mockRequestBody.city,
        userId: mockRequestBody.userId,
      },
    });

    expect(Address.update).toHaveBeenCalledWith(
      {
        street: mockRequestBody.street,
        postalCode: mockRequestBody.postalCode,
        state: mockRequestBody.state,
        city: mockRequestBody.city,
        userId: mockRequestBody.userId,
      },
      { where: { id: mockAddressId } }
    );

    expect(next).toHaveBeenCalledWith(createCustomError(`No address with id: ${mockAddressId} is found`, 404));
    expect(res.status).not.toHaveBeenCalled();
    expect(res.json).not.toHaveBeenCalled();
  });

  it('should invoke the next middleware with a custom error if nothing to update', async () => {
    const mockAddressId = 1;
    const mockRequestBody = {
      street: '789 Elm St',
      postalCode: '67890',
      state: 'NY',
      city: 'New York',
      userId: 3,
    };

    Address.findOne = jest.fn().mockResolvedValue({ id: mockAddressId, ...mockRequestBody });

    const req = { params: { id: mockAddressId }, body: mockRequestBody };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await updateAddress(req, res, next);

    expect(Address.findOne).toHaveBeenCalledWith({
      where: {
        street: mockRequestBody.street,
        postalCode: mockRequestBody.postalCode,
        state: mockRequestBody.state,
        city: mockRequestBody.city,
        userId: mockRequestBody.userId,
      },
    });

    expect(next).toHaveBeenCalledWith(createCustomError('Nothing to update', 200));
    // expect(Address.update).not.toHaveBeenCalled();
    // expect(Address.findByPk).not.toHaveBeenCalled();
    expect(res.status).not.toHaveBeenCalled();
    expect(res.json).not.toHaveBeenCalled();
  });
});
