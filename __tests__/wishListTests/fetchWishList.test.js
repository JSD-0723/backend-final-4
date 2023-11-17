/* eslint-disable no-undef */
jest.useFakeTimers();

const { fetchWishList } = require('../../controllers/wishListController');
const { WishList } = require('../../models');
const { createCustomError } = require('../../utils/errors/custom-error');

describe('fetchWishList', () => {
  it('should fetch the wish list and return success response', async () => {
    const mockUserId = 1;
    const mockWishList = {
      id: 1,
      userId: mockUserId,
    };

    WishList.findOne = jest.fn().mockResolvedValue(mockWishList);

    const req = { body: { userId: mockUserId } };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await fetchWishList(req, res, next);

    expect(res.json).toHaveBeenCalledWith({
      success: true,
      message: 'Wish list successfully Fetched',
      data: mockWishList,
    });

    expect(next).not.toHaveBeenCalled();
  });

  it('should invoke the next middleware with a custom error if wish list is not found', async () => {
    const mockUserId = 1;

    WishList.findOne = jest.fn().mockResolvedValue(null);

    const req = { body: { userId: mockUserId } };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await fetchWishList(req, res, next);

    expect(next).toHaveBeenCalledWith(createCustomError('Invalid User', 403));
    expect(res.status).not.toHaveBeenCalled();
    expect(res.json).not.toHaveBeenCalled();
  });
});
