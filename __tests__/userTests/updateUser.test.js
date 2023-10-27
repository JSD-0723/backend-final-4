/* eslint-disable no-undef */
const { updateUser } = require('../../controllers/userController');
const { User } = require('../../models');
const { createCustomError } = require('../../utils/errors/custom-error');
const bcrypt = require('bcrypt');

describe('updateUser', () => {
    it('should update the user and return success response', async () => {
        const mockUserId = 1;
        const mockRequestBody = {
            firstName: 'John',
            lastName: 'Doe',
            email: 'john.doe@example.com',
            mobile: '1234567890',
            dateOfBirth: '1990-01-01',
            password: 'newpassword',
            imageUrl: 'http://example.com/image.jpg',
        };
        const mockUpdatedRowCount = 1;
        const mockUpdatedUser = { id: mockUserId, ...mockRequestBody, password: 'hashedpassword' };

        User.findOne = jest.fn().mockResolvedValue(null);
        User.findByPk = jest.fn().mockResolvedValue({ id: mockUserId, ...mockRequestBody, password: 'hashedpassword' });
        bcrypt.compareSync = jest.fn().mockReturnValue(true);
        User.update = jest.fn().mockResolvedValue([mockUpdatedRowCount]);
        User.findByPk = jest.fn().mockResolvedValue(mockUpdatedUser);

        const req = { params: { id: mockUserId }, body: mockRequestBody };
        const res = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn(),
        };
        const next = jest.fn();

        await updateUser(req, res, next);

        expect(User.findOne).toHaveBeenCalledWith({
            where: {
                firstName: mockRequestBody.firstName,
                lastName: mockRequestBody.lastName,
                email: mockRequestBody.email,
                mobile: mockRequestBody.mobile,
                dateOfBirth: mockRequestBody.dateOfBirth,
                imageUrl: mockRequestBody.imageUrl,
            },
        });

        expect(User.findByPk).toHaveBeenCalledWith(mockUserId);

        expect(bcrypt.compareSync).toHaveBeenCalledWith(mockRequestBody.password, 'hashedpassword');

        expect(User.update).toHaveBeenCalledWith(
            {
                firstName: mockRequestBody.firstName,
                lastName: mockRequestBody.lastName,
                email: mockRequestBody.email,
                mobile: mockRequestBody.mobile,
                dateOfBirth: mockRequestBody.dateOfBirth,
                password: mockRequestBody.password,
                imageUrl: mockRequestBody.imageUrl,
            },
            { where: { id: mockUserId } }
        );

        expect(User.findByPk).toHaveBeenCalledWith(mockUserId);

        expect(res.status).toHaveBeenCalledWith(200);
        expect(res.json).toHaveBeenCalledWith({
            success: true,
            message: 'User updated successfully',
            data: mockUpdatedUser,
        });

        expect(next).not.toHaveBeenCalled();
    });

    it('should invoke the next middleware with a custom error if user is not found for update', async () => {
        const mockUserId = 1;
        const mockRequestBody = {
            firstName: 'John',
            lastName: 'Doe',
            email: 'john.doe@example.com',
            mobile: '1234567890',
            dateOfBirth: '1990-01-01',
            password: 'newpassword',
            imageUrl: 'http://example.com/image.jpg',
        };
        const mockUpdatedRowCount = 0;

        User.findOne = jest.fn().mockResolvedValue(null);
        User.update = jest.fn().mockResolvedValue([mockUpdatedRowCount]);

        const req = { params: { id: mockUserId }, body: mockRequestBody };
        const res = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn(),
        };
        const next = jest.fn();

        await updateUser(req, res, next);

        expect(User.findOne).toHaveBeenCalledWith({
            where: {
                firstName: mockRequestBody.firstName,
                lastName: mockRequestBody.lastName,
                email: mockRequestBody.email,
                mobile: mockRequestBody.mobile,
                dateOfBirth: mockRequestBody.dateOfBirth,
                imageUrl: mockRequestBody.imageUrl,
            },
        });

        expect(User.update).toHaveBeenCalledWith(
            {
                firstName: mockRequestBody.firstName,
                lastName: mockRequestBody.lastName,
                email: mockRequestBody.email,
                mobile: mockRequestBody.mobile,
                dateOfBirth: mockRequestBody.dateOfBirth,
                password: mockRequestBody.password,
                imageUrl: mockRequestBody.imageUrl,
            },
            { where: { id: mockUserId } }
        );

        expect(next).toHaveBeenCalledWith(createCustomError(`No user with id: ${mockUserId} is found`, 404));
        expect(res.status).not.toHaveBeenCalled();
        expect(res.json).not.toHaveBeenCalled();
    });

    it('should invoke the next middleware with a custom error if user is not found for update', async () => {
        const mockUserId = 1;
        const mockRequestBody = {
            firstName: 'John',
            lastName: 'Doe',
            email: 'john.doe@example.com',
            mobile: '1234567890',
            dateOfBirth: '1990-01-01',
            password: 'newpassword',
            imageUrl: 'http://example.com/image.jpg',
        };
        const mockUpdatedRowCount = 0;

        User.findOne = jest.fn().mockResolvedValue(null);
        User.update = jest.fn().mockResolvedValue([mockUpdatedRowCount]);

        const req = { params: { id: mockUserId }, body: mockRequestBody };
        const res = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn(),
        };
        const next = jest.fn();

        await updateUser(req, res, next);

        expect(User.findOne).toHaveBeenCalledWith({
            where: {
                firstName: mockRequestBody.firstName,
                lastName: mockRequestBody.lastName,
                email: mockRequestBody.email,
                mobile: mockRequestBody.mobile,
                dateOfBirth: mockRequestBody.dateOfBirth,
                imageUrl: mockRequestBody.imageUrl,
            },
        });

        expect(User.update).toHaveBeenCalledWith(
            {
                firstName: mockRequestBody.firstName,
                lastName: mockRequestBody.lastName,
                email: mockRequestBody.email,
                mobile: mockRequestBody.mobile,
                dateOfBirth: mockRequestBody.dateOfBirth,
                password: mockRequestBody.password,
                imageUrl: mockRequestBody.imageUrl,
            },
            { where: { id: mockUserId } }
        );

        expect(next).toHaveBeenCalledWith(createCustomError(`No user with id: ${mockUserId} is found`, 404));
        expect(res.status).not.toHaveBeenCalled();
        expect(res.json).not.toHaveBeenCalled();
    });

    it('should invoke the next middleware with a custom error if nothing to update (no changes)', async () => {
        const mockUserId = 1;
        const mockRequestBody = {
            // No changes in the request body
        };

        User.findOne = jest.fn().mockResolvedValue({ id: mockUserId, firstName: 'John' });
        User.update = jest.fn().mockResolvedValue([0]);

        const req = { params: { id: mockUserId }, body: mockRequestBody };
        const res = {
            status: jest.fn().mockReturnThis(),
            json: jest.fn(),
        };
        const next = jest.fn();
        await updateUser(req, res, next);

        // expect(User.findOne).toHaveBeenCalledWith({
        //     where: {
        //         id: mockUserId,
        //     },
        // });

        // The update function should not be called if there are no changes in the request body
        expect(User.update).not.toHaveBeenCalled();

        expect(next).toHaveBeenCalledWith(createCustomError('Nothing to update', 200));
        expect(res.status).not.toHaveBeenCalled();
        expect(res.json).not.toHaveBeenCalled();
    });

});