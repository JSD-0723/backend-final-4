/* eslint-disable no-undef */
const { getUser } = require('../../controllers/userController');
const { User } = require('../../models');
const { createCustomError } = require('../../utils/errors/custom-error');

describe('getUser', () => {
  it('should retrieve the user and return success response', async () => {
    const mockUserId = 1;
    const mockUser = { id: mockUserId, firstName: 'John', lastName: 'Doe', email: 'john.doe@example.com' };

    User.findByPk = jest.fn().mockResolvedValue(mockUser);

    const req = { params: { id: mockUserId } };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await getUser(req, res, next);

    expect(User.findByPk).toHaveBeenCalledWith(mockUserId);

    expect(res.status).toHaveBeenCalledWith(200);
    expect(res.json).toHaveBeenCalledWith({
      success: true,
      message: 'User fetched successfully',
      data: mockUser,
    });

    expect(next).not.toHaveBeenCalled();
  });

  it('should invoke the next middleware with a custom error if user is not found', async () => {
    const mockUserId = 1;

    User.findByPk = jest.fn().mockResolvedValue(null);

    const req = { params: { id: mockUserId } };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await getUser(req, res, next);

    expect(User.findByPk).toHaveBeenCalledWith(mockUserId);

    expect(next).toHaveBeenCalledWith(createCustomError(`No user with id: ${mockUserId} is found`, 404));
    expect(res.status).not.toHaveBeenCalled();
    expect(res.json).not.toHaveBeenCalled();
  });
});
