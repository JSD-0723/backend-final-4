/* eslint-disable no-undef */
const { getUsers } = require('../../controllers/userController');
const { User } = require('../../models');

describe('getUsers', () => {
  it('should retrieve all users and return success response', async () => {
    const mockUsers = [
      { id: 1, firstName: 'John', lastName: 'Doe', email: 'john.doe@example.com' },
      { id: 2, firstName: 'Jane', lastName: 'Smith', email: 'jane.smith@example.com' },
    ];

    User.findAll = jest.fn().mockResolvedValue(mockUsers);

    const req = {};
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };

    await getUsers(req, res);

    expect(User.findAll).toHaveBeenCalled();

    expect(res.status).toHaveBeenCalledWith(200);
    expect(res.json).toHaveBeenCalledWith({
      success: true,
      message: 'Users fetched successfully',
      data: mockUsers,
    });
  });
});
