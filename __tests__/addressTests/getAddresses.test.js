/* eslint-disable no-undef */
const { getAddresses } = require('../../controllers/addressController');
const { Address } = require('../../models');

describe('getAddresses', () => {
  it('should retrieve all addresses and return success response', async () => {
    const mockAddresses = [
      { id: 1, street: '123 Main St' },
      { id: 2, street: '456 Oak St' },
    ];

    Address.findAll = jest.fn().mockResolvedValue(mockAddresses);

    const req = {};
    const res = {
      status: jest.fn().mockReturnThis(),
      json: jest.fn(),
    };

    await getAddresses(req, res);

    expect(Address.findAll).toHaveBeenCalled();

    expect(res.status).toHaveBeenCalledWith(200);
    expect(res.json).toHaveBeenCalledWith({
      success: true,
      message: 'Addresses fetched successfully',
      data: mockAddresses,
    });
  });
});


// realdata

/* eslint-disable no-undef */
// const { getAddresses } = require('../../controllers/addressController');
// const { Address } = require('../../models');

// describe('getAddresses', () => {
//   it('should retrieve all addresses and return success response', async () => {
//     // Assuming you have a real database connection, this will fetch actual data
//     const realAddresses = await Address.findAll();

//     Address.findAll = jest.fn().mockResolvedValue(realAddresses);

//     const req = {};
//     const res = {
//       status: jest.fn().mockReturnThis(),
//       json: jest.fn(),
//     };

//     await getAddresses(req, res);

//     expect(Address.findAll).toHaveBeenCalled();

//     expect(res.status).toHaveBeenCalledWith(200);
//     expect(res.json).toHaveBeenCalledWith({
//       success: true,
//       message: 'Addresses fetched successfully',
//       data: realAddresses,
//     });
//   });
// });
