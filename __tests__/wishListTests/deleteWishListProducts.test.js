/* eslint-disable no-undef */
const { deleteWishListProducts } = require('../../controllers/wishListController');
const { User, WishListItem } = require('../../models');
const { createCustomError } = require('../../utils/errors/custom-error');

describe('deleteWishListProducts', () => {
  it('should delete all products in the user\'s wishlist and return success response', async () => {
    const mockRequestBody = {
      userId: 1,
    };

    const mockUser = { id: 1, getWishList: jest.fn().mockResolvedValue({ id: 1 }) };
    User.findByPk = jest.fn().mockResolvedValue(mockUser);
    WishListItem.destroy = jest.fn().mockResolvedValue(2);

    const req = { body: mockRequestBody };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await deleteWishListProducts(req, res, next);

    expect(User.findByPk).toHaveBeenCalledWith(mockRequestBody.userId);
    expect(mockUser.getWishList).toHaveBeenCalled();
    // expect(WishListItem.destroy).toHaveBeenCalledWith({
    //   where: {
    //     wishListId: mockUser.getWishList().id,
    //   },
    // });

    expect(res.status).toHaveBeenCalledWith(200);
    expect(res.json).toHaveBeenCalledWith({
      success: true,
      message: 'All products in wishlist deleted successfully',
    });

    expect(next).not.toHaveBeenCalled();
  });

  it('should invoke the next middleware with a custom error if userId is missing', async () => {
    const mockRequestBody = {
      userId: null,
    };

    const req = { body: mockRequestBody };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await deleteWishListProducts(req, res, next);

    expect(next).toHaveBeenCalledWith(createCustomError('userId is required in the request body', 400));
    expect(res.status).not.toHaveBeenCalled();
    expect(res.json).not.toHaveBeenCalled();
  });

  it('should invoke the next middleware with a custom error if user is not found', async () => {
    const mockRequestBody = {
      userId: 1,
    };

    User.findByPk = jest.fn().mockResolvedValue(null);

    const req = { body: mockRequestBody };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await deleteWishListProducts(req, res, next);

    expect(next).toHaveBeenCalledWith(createCustomError('User not found', 404));
    expect(res.status).not.toHaveBeenCalled();
    expect(res.json).not.toHaveBeenCalled();
  });

  it('should invoke the next middleware with a custom error if wishlist is not found', async () => {
    const mockRequestBody = {
      userId: 1,
    };

    const mockUser = { id: 1, getWishList: jest.fn().mockResolvedValue(null) };
    User.findByPk = jest.fn().mockResolvedValue(mockUser);

    const req = { body: mockRequestBody };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await deleteWishListProducts(req, res, next);

    expect(User.findByPk).toHaveBeenCalledWith(mockRequestBody.userId);
    expect(mockUser.getWishList).toHaveBeenCalled();

    expect(next).toHaveBeenCalledWith(createCustomError('Wishlist not found', 404));
    expect(res.status).not.toHaveBeenCalled();
    expect(res.json).not.toHaveBeenCalled();
  });
});
