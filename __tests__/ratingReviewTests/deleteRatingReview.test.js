/* eslint-disable no-undef */
const { deleteRatingReview } = require('../../controllers/ratingReviewController');
const { RatingReview } = require('../../models');
const { createCustomError } = require('../../utils/errors/custom-error');

describe('deleteRatingReview', () => {
  it('should delete the ratingReview and return success response', async () => {
    const mockRatingReviewId = 1;
    const mockDeletedRowCount = 1;

    RatingReview.destroy = jest.fn().mockResolvedValue(mockDeletedRowCount);

    const req = { params: { id: mockRatingReviewId } };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await deleteRatingReview(req, res, next);

    expect(RatingReview.destroy).toHaveBeenCalledWith({ where: { id: mockRatingReviewId } });

    expect(res.status).toHaveBeenCalledWith(200);
    expect(res.json).toHaveBeenCalledWith({
      success: true,
      message: 'RatingReview deleted successfully',
    });

    expect(next).not.toHaveBeenCalled();
  });

  it('should invoke the next middleware with a custom error if ratingReview is not found for deletion', async () => {
    const mockRatingReviewId = 1;
    const mockDeletedRowCount = 0;

    RatingReview.destroy = jest.fn().mockResolvedValue(mockDeletedRowCount);

    const req = { params: { id: mockRatingReviewId } };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await deleteRatingReview(req, res, next);

    expect(RatingReview.destroy).toHaveBeenCalledWith({ where: { id: mockRatingReviewId } });

    expect(next).toHaveBeenCalledWith(createCustomError(`No ratingReview with id: ${mockRatingReviewId} is found`, 404));
    expect(res.status).not.toHaveBeenCalled();
    expect(res.json).not.toHaveBeenCalled();
  });
});
