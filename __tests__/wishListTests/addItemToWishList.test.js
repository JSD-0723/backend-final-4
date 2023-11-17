/* eslint-disable no-undef */
const { addItemToWishList } = require('../../controllers/wishListController');
const { User, WishListItem } = require('../../models');
const { createCustomError } = require('../../utils/errors/custom-error');

describe('addItemToWishList', () => {
    it('should add a product to the user\'s wishlist and return success response', async () => {
        const mockRequestBody = {
            userId: 1,
            productId: 3,
        };

        const mockUser = { id: 1, getWishList: jest.fn().mockResolvedValue({ id: 1 }) };
        User.findByPk = jest.fn().mockResolvedValue(mockUser);
        WishListItem.findOne = jest.fn().mockResolvedValue(null);
        WishListItem.create = jest.fn().mockResolvedValue({ id: 2, ...mockRequestBody });

        const req = { body: mockRequestBody };
        const res = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn(),
        };
        const next = jest.fn();

        await addItemToWishList(req, res, next);

        expect(User.findByPk).toHaveBeenCalledWith(mockRequestBody.userId);
        expect(mockUser.getWishList).toHaveBeenCalled();
        // expect(WishListItem.findOne).toHaveBeenCalledWith({
        //   where: {
        //     wishListId: mockUser.getWishList().id,
        //     productId: mockRequestBody.productId,
        //   },
        // });
        // expect(WishListItem.create).toHaveBeenCalledWith({
        //   wishListId: mockUser.getWishList().id,
        //   productId: mockRequestBody.productId,
        // });

        expect(res.status).toHaveBeenCalledWith(200);
        expect(res.json).toHaveBeenCalledWith({
            success: true,
            message: 'Product added to wishlist',
            data: { id: 2, ...mockRequestBody },
        });

        expect(next).not.toHaveBeenCalled();
    });

    it('should invoke the next middleware with a custom error if userId or productId is missing', async () => {
        const mockRequestBody = {
            userId: null,
            productId: 3,
        };

        const req = { body: mockRequestBody };
        const res = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn(),
        };
        const next = jest.fn();

        await addItemToWishList(req, res, next);

        expect(next).toHaveBeenCalledWith(createCustomError('userId and productId are required in the request body', 400));
        expect(res.status).not.toHaveBeenCalled();
        expect(res.json).not.toHaveBeenCalled();
    });

    it('should invoke the next middleware with a custom error if user is not found', async () => {
        const mockRequestBody = {
            userId: 1,
            productId: 3,
        };

        User.findByPk = jest.fn().mockResolvedValue(null);

        const req = { body: mockRequestBody };
        const res = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn(),
        };
        const next = jest.fn();

        await addItemToWishList(req, res, next);

        expect(next).toHaveBeenCalledWith(createCustomError('User not found', 404));
        expect(res.status).not.toHaveBeenCalled();
        expect(res.json).not.toHaveBeenCalled();
    });

    it('should invoke the next middleware with a custom error if product already exists in wishlist', async () => {
        const mockRequestBody = {
            userId: 1,
            productId: 3,
        };

        const mockUser = { id: 1, getWishList: jest.fn().mockResolvedValue({ id: 1 }) };
        User.findByPk = jest.fn().mockResolvedValue(mockUser);
        WishListItem.findOne = jest.fn().mockResolvedValue({ id: 2, ...mockRequestBody });

        const req = { body: mockRequestBody };
        const res = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn(),
        };
        const next = jest.fn();

        await addItemToWishList(req, res, next);

        expect(User.findByPk).toHaveBeenCalledWith(mockRequestBody.userId);
        expect(mockUser.getWishList).toHaveBeenCalled();
        // expect(WishListItem.findOne).toHaveBeenCalledWith({
        //   where: {
        //     wishListId: mockUser.getWishList().id,
        //     productId: mockRequestBody.productId,
        //   },
        // });

        expect(next).toHaveBeenCalledWith(createCustomError('Product already exists in wishlist', 200));
        expect(res.status).not.toHaveBeenCalled();
        expect(res.json).not.toHaveBeenCalled();
    });
});