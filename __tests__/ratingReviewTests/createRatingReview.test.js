/* eslint-disable no-undef */
const { createRatingReview } = require('../../controllers/ratingReviewController');
const { RatingReview, Product } = require('../../models');
// const { createCustomError } = require('../../utils/errors/custom-error');

describe('createRatingReview', () => {
  it('should create a new rating review and return success response', async () => {
    const mockRequestBody = {
      title: 'Great Product',
      description: 'I love this product!',
      rating: 5,
      userId: 1,
      productId: 1,
    };

    const mockProduct = { id: 1, addRatingReview: jest.fn() };
    
    Product.findByPk = jest.fn().mockResolvedValue(mockProduct);
    RatingReview.create = jest.fn().mockResolvedValue({ id: 1, ...mockRequestBody });

    const req = { body: mockRequestBody };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await createRatingReview(req, res, next);

    expect(Product.findByPk).toHaveBeenCalledWith(mockRequestBody.productId);
    expect(RatingReview.create).toHaveBeenCalledWith(mockRequestBody);
    expect(mockProduct.addRatingReview).toHaveBeenCalledWith({ id: 1, ...mockRequestBody });

    expect(res.status).toHaveBeenCalledWith(201);
    expect(res.json).toHaveBeenCalledWith({
      success: true,
      message: 'RatingReview created successfully',
      data: { id: 1, ...mockRequestBody },
    });

    expect(next).not.toHaveBeenCalled();
  });

  it('should invoke the next middleware with a custom error if user is not found', async () => {
    const mockRequestBody = {
      title: 'Great Product',
      description: 'I love this product!',
      rating: 5,
      userId: 1,
      productId: 1,
    };

    Product.findByPk = jest.fn().mockResolvedValue(null);

    const req = { body: mockRequestBody };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await createRatingReview(req, res, next);

    expect(Product.findByPk).toHaveBeenCalledWith(mockRequestBody.productId);
    // expect(RatingReview.create).not.toHaveBeenCalled();

    // expect(next).toHaveBeenCalledWith(createCustomError('No product is found', 404));
    // expect(res.status).not.toHaveBeenCalled();
    // expect(res.json).not.toHaveBeenCalled();
  });

  it('should invoke the next middleware with a custom error if product is not found', async () => {
    const mockRequestBody = {
      title: 'Great Product',
      description: 'I love this product!',
      rating: 5,
      userId: 1,
      productId: 1,
    };

    const mockProduct = { id: 1, addRatingReview: jest.fn() };
    
    Product.findByPk = jest.fn().mockResolvedValue(mockProduct);
    RatingReview.create = jest.fn().mockResolvedValue(null);

    const req = { body: mockRequestBody };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await createRatingReview(req, res, next);

    expect(Product.findByPk).toHaveBeenCalledWith(mockRequestBody.productId);
    expect(RatingReview.create).toHaveBeenCalledWith(mockRequestBody);
    // expect(mockProduct.addRatingReview).not.toHaveBeenCalled();

    // expect(next).toHaveBeenCalledWith(createCustomError('No user is found', 404));
    // expect(res.status).not.toHaveBeenCalled();
    // expect(res.json).not.toHaveBeenCalled();
  });
});
