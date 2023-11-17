/* eslint-disable no-undef */
const { getRatingReviews } = require('../../controllers/ratingReviewController');
const { RatingReview } = require('../../models');

describe('getRatingReviews', () => {
    it('should retrieve all ratingReviews and return success response', async () => {
        const mockRatingReviews = [
            { id: 1, title: 'Great Product', rating: 5 },
            { id: 2, title: 'Good Product', rating: 4 },
        ];

        RatingReview.findAll = jest.fn().mockResolvedValue(mockRatingReviews);

        const req = {};
        const res = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn(),
        };

        await getRatingReviews(req, res);

        expect(RatingReview.findAll).toHaveBeenCalled();

        expect(res.status).toHaveBeenCalledWith(200);
        expect(res.json).toHaveBeenCalledWith({
            success: true,
            message: 'RatingReviews fetched successfully',
            data: mockRatingReviews,
        });
    });
});
