/* eslint-disable no-undef */
const { getRatingReview } = require('../../controllers/ratingReviewController');
const { RatingReview } = require('../../models');
const { createCustomError } = require('../../utils/errors/custom-error');

describe('getRatingReview', () => {
  it('should return the ratingReview if found', async () => {
    const mockRatingReview = { id: 1, rating: 4, review: 'Great experience' };

    RatingReview.findByPk = jest.fn().mockResolvedValue(mockRatingReview);

    const req = { params: { id: 1 } };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await getRatingReview(req, res, next);

    expect(RatingReview.findByPk).toHaveBeenCalledWith(1);

    expect(res.status).toHaveBeenCalledWith(200);
    expect(res.json).toHaveBeenCalledWith({
      success: true,
      message: 'RatingReview fetched successfully',
      data: mockRatingReview,
    });

    expect(next).not.toHaveBeenCalled();
  });

  it('should invoke the next middleware with a custom error if ratingReview is not found', async () => {
    RatingReview.findByPk = jest.fn().mockResolvedValue(null);

    const req = { params: { id: 1 } };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await getRatingReview(req, res, next);

    expect(RatingReview.findByPk).toHaveBeenCalledWith(1);

    expect(next).toHaveBeenCalledWith(createCustomError('No ratingReview with id: 1 is found', 404));
    expect(res.status).not.toHaveBeenCalled();
    expect(res.json).not.toHaveBeenCalled();
  });
});
