/* eslint-disable no-undef */
const { createUser } = require('../../controllers/userController');
const { User } = require('../../models');
const { createCustomError } = require('../../utils/errors/custom-error');

describe('createUser', () => {
  it('should create a new admin user and return success response', async () => {
    const mockRequestBody = {
      firstName: 'John',
      lastName: 'Doe',
      email: 'john.doe@example.com',
      mobile: '1234567890',
      dateOfBirth: '1990-01-01',
      password: 'password123',
      imageUrl: 'https://example.com/image.jpg',
    };

    User.findOne = jest.fn().mockResolvedValue(null);
    User.create = jest.fn().mockResolvedValue({
      id: 1,
      role: 'admin',
      ...mockRequestBody,
    });

    const req = { body: mockRequestBody };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await createUser(req, res, next);

    expect(User.findOne).toHaveBeenCalledWith({ where: { email: mockRequestBody.email } });

    expect(User.create).toHaveBeenCalledWith({
      firstName: mockRequestBody.firstName,
      lastName: mockRequestBody.lastName,
      email: mockRequestBody.email,
      mobile: mockRequestBody.mobile,
      dateOfBirth: mockRequestBody.dateOfBirth,
      password: mockRequestBody.password,
      imageUrl: mockRequestBody.imageUrl,
      role: 'admin',
    });

    expect(res.status).toHaveBeenCalledWith(201);
    expect(res.json).toHaveBeenCalledWith({
      success: true,
      message: 'Admin created successfully',
      data: {
        id: 1,
        role: 'admin',
        ...mockRequestBody,
      },
    });

    expect(next).not.toHaveBeenCalled();
  });

  it('should invoke the next middleware with a custom error if email already exists', async () => {
    const mockRequestBody = {
      firstName: 'John',
      lastName: 'Doe',
      email: 'john.doe@example.com',
      mobile: '1234567890',
      dateOfBirth: '1990-01-01',
      password: 'password123',
      imageUrl: 'https://example.com/image.jpg',
    };

    User.findOne = jest.fn().mockResolvedValue({ id: 1, ...mockRequestBody });

    const req = { body: mockRequestBody };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await createUser(req, res, next);

    expect(User.findOne).toHaveBeenCalledWith({ where: { email: mockRequestBody.email } });

    expect(next).toHaveBeenCalledWith(createCustomError(`Email ${mockRequestBody.email} already exists`, 400));
    expect(res.status).not.toHaveBeenCalled();
    expect(res.json).not.toHaveBeenCalled();
  });
});