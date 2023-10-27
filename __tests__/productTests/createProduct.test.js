/* eslint-disable no-undef */
const { createProduct } = require('../../controllers/productController');
const { Product } = require('../../models');

describe('createProduct', () => {
  it('should create a new product and return success response', async () => {
    const mockRequestBody = {
      title: 'New Product',
      description: 'A great product',
      price: 29.99,
      availableInStock: 100,
      totalRating: 0,
      ratingCount: 0,
      imageUrl: 'https://example.com/image.jpg',
      categoryId: 1,
      brandId: 1,
      discountId: 1,
    };

    Product.findOne = jest.fn().mockResolvedValue(null);
    Product.create = jest.fn().mockResolvedValue({ id: 1, ...mockRequestBody });

    const req = { body: mockRequestBody };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await createProduct(req, res, next);

    expect(Product.create).toHaveBeenCalledWith(mockRequestBody);

    expect(res.status).toHaveBeenCalledWith(201);
    expect(res.json).toHaveBeenCalledWith({
      success: true,
      message: 'Product created successfully',
      data: { id: 1, ...mockRequestBody },
    });

    expect(next).not.toHaveBeenCalled();
  });

});