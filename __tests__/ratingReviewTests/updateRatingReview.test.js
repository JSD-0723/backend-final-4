/* eslint-disable no-undef */
const { updateRatingReview } = require('../../controllers/ratingReviewController');
const { RatingReview } = require('../../models');
const { createCustomError } = require('../../utils/errors/custom-error');

describe('updateRatingReview', () => {
  it('should update the ratingReview and return success response', async () => {
    const mockRatingReviewId = 1;
    const mockRequestBody = {
      title: 'Updated Title',
      description: 'Updated description',
      rating: 5,
      userId: 3,
      productId: 4,
    };
    const mockUpdatedRowCount = 1;
    const mockUpdatedRatingReview = { id: mockRatingReviewId, ...mockRequestBody };

    RatingReview.findOne = jest.fn().mockResolvedValue(null);
    RatingReview.update = jest.fn().mockResolvedValue([mockUpdatedRowCount]);
    RatingReview.findByPk = jest.fn().mockResolvedValue(mockUpdatedRatingReview);

    const req = { params: { id: mockRatingReviewId }, body: mockRequestBody };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await updateRatingReview(req, res, next);

    expect(RatingReview.findOne).toHaveBeenCalledWith({
      where: {
        title: mockRequestBody.title,
        description: mockRequestBody.description,
        rating: mockRequestBody.rating,
        userId: mockRequestBody.userId,
        productId: mockRequestBody.productId,
      },
    });

    expect(RatingReview.update).toHaveBeenCalledWith(
      {
        title: mockRequestBody.title,
        description: mockRequestBody.description,
        rating: mockRequestBody.rating,
        userId: mockRequestBody.userId,
        productId: mockRequestBody.productId,
      },
      { where: { id: mockRatingReviewId } }
    );

    expect(RatingReview.findByPk).toHaveBeenCalledWith(mockRatingReviewId);

    expect(res.status).toHaveBeenCalledWith(200);
    expect(res.json).toHaveBeenCalledWith({
      success: true,
      message: 'RatingReview updated successfully',
      data: mockUpdatedRatingReview,
    });

    expect(next).not.toHaveBeenCalled();
  });

  it('should invoke the next middleware with a custom error if ratingReview is not found for update', async () => {
    const mockRatingReviewId = 1;
    const mockRequestBody = {
      title: 'Updated Title',
      description: 'Updated description',
      rating: 5,
      userId: 3,
      productId: 4,
    };
    const mockUpdatedRowCount = 0;

    RatingReview.findOne = jest.fn().mockResolvedValue(null);
    RatingReview.update = jest.fn().mockResolvedValue([mockUpdatedRowCount]);

    const req = { params: { id: mockRatingReviewId }, body: mockRequestBody };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await updateRatingReview(req, res, next);

    expect(RatingReview.findOne).toHaveBeenCalledWith({
      where: {
        title: mockRequestBody.title,
        description: mockRequestBody.description,
        rating: mockRequestBody.rating,
        userId: mockRequestBody.userId,
        productId: mockRequestBody.productId,
      },
    });

    expect(RatingReview.update).toHaveBeenCalledWith(
      {
        title: mockRequestBody.title,
        description: mockRequestBody.description,
        rating: mockRequestBody.rating,
        userId: mockRequestBody.userId,
        productId: mockRequestBody.productId,
      },
      { where: { id: mockRatingReviewId } }
    );

    expect(next).toHaveBeenCalledWith(createCustomError(`No ratingReview with id: ${mockRatingReviewId} is found`, 404));
    expect(res.status).not.toHaveBeenCalled();
    expect(res.json).not.toHaveBeenCalled();
  });

  it('should invoke the next middleware with a custom error if nothing to update', async () => {
    const mockRatingReviewId = 1;
    const mockRequestBody = {
      title: 'Updated Title',
      description: 'Updated description',
      rating: 5,
      userId: 3,
      productId: 4,
    };

    RatingReview.findOne = jest.fn().mockResolvedValue({ id: mockRatingReviewId, ...mockRequestBody });

    const req = { params: { id: mockRatingReviewId }, body: mockRequestBody };
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };
    const next = jest.fn();

    await updateRatingReview(req, res, next);

    expect(RatingReview.findOne).toHaveBeenCalledWith({
      where: {
        title: mockRequestBody.title,
        description: mockRequestBody.description,
        rating: mockRequestBody.rating,
        userId: mockRequestBody.userId,
        productId: mockRequestBody.productId,
      },
    });

    expect(next).toHaveBeenCalledWith(createCustomError('Nothing to update', 200));
    // expect(RatingReview.update).not.toHaveBeenCalled();
    // expect(RatingReview.findByPk).not.toHaveBeenCalled();
    expect(res.status).not.toHaveBeenCalled();
    expect(res.json).not.toHaveBeenCalled();
  });
});
