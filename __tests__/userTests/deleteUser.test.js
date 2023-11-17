/* eslint-disable no-undef */
const { deleteUser } = require('../../controllers/userController');
const { User } = require('../../models');
const { createCustomError } = require('../../utils/errors/custom-error');

describe('deleteUser', () => {
  it('should delete the user and return success response', async () => {
    const mockUserId = 1;
    const mockDeletedRowCount = 1;

    User.destroy = jest.fn().mockResolvedValue(mockDeletedRowCount);

    const req = { params: { id: mockUserId } };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await deleteUser(req, res, next);

    expect(User.destroy).toHaveBeenCalledWith({ where: { id: mockUserId } });

    expect(res.status).toHaveBeenCalledWith(200);
    expect(res.json).toHaveBeenCalledWith({
      success: true,
      message: 'User deleted successfully',
    });

    expect(next).not.toHaveBeenCalled();
  });

  it('should invoke the next middleware with a custom error if user is not found', async () => {
    const mockUserId = 1;
    const mockDeletedRowCount = 0;

    User.destroy = jest.fn().mockResolvedValue(mockDeletedRowCount);

    const req = { params: { id: mockUserId } };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await deleteUser(req, res, next);

    expect(User.destroy).toHaveBeenCalledWith({ where: { id: mockUserId } });

    expect(next).toHaveBeenCalledWith(createCustomError(`No user with id: ${mockUserId} is found`, 404));
    expect(res.status).not.toHaveBeenCalled();
    expect(res.json).not.toHaveBeenCalled();
  });
});
