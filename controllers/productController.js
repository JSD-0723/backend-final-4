// Import necessary modules and dependencies
const { Product, RatingReview } = require('../models');
const { asyncWrapper } = require('../middleware');
const { createCustomError } = require('../utils/errors/custom-error');
const { Op } = require('sequelize');

/**
 * Creates a new product in the database.
 * @param {Object} req - Express request object.
 * @param {Object} res - Express response object.
 */
const createProduct = asyncWrapper(async (req, res, next) => {
  // Destructure required properties from the request body
  const {
    title,
    description,
    price,
    availableInStock,
    totalRating,
    ratingCount,
    imageUrl,
    categoryId,
    brandId,
    discountId,
  } = req.body;

  const existProduct = await Product.findOne({
    where: {
      title,
      description,
      price,
      // availableInStock,
      // totalRating,
      // ratingCount,
      // imageUrl,
      categoryId,
      brandId,
      // discountId,
    },
  });

  if (existProduct) {
    return next(createCustomError('Product already exists', 200));
  }

  // Create a new product in the database
  const product = await Product.create({
    title,
    description,
    price,
    availableInStock,
    totalRating,
    ratingCount,
    imageUrl,
    categoryId,
    brandId,
    discountId,
  });

  // Log the created product and send a success response
  console.log('Created product: ', product?.title);
  res.status(201).json({
    success: true,
    message: 'Product created successfully',
    data: product,
  });
});

/**
 * Retrieves all products from the database.
 * @param {Object} req - Express request object.
 * @param {Object} res - Express response object.
 */
const getProducts = asyncWrapper(async (req, res) => {
  // Extract request query parameters
  const page = req.query.page ? parseInt(req.query.page) : 1;
  const itemsPerPage = 20;
  const offset = (page - 1) * itemsPerPage;

  const newArrival = req.query.newArrival
    ? JSON.parse(req.query.newArrival)
    : false;

  const handpicked = req.query.handpicked
    ? JSON.parse(req.query.handpicked)
    : false;

  // where clause if the newArrival exists
  let whereClause = {};
  if (newArrival) {
    const threeMonthsAgo = new Date();
    threeMonthsAgo.setMonth(threeMonthsAgo.getMonth() - 3);
    whereClause.createdAt = {
      [Op.gte]: threeMonthsAgo,
    };
  }
  if (handpicked) {
    whereClause.totalRating = { [Op.gte]: 4.5 };
    whereClause.price = { [Op.lte]: 100 };
  }

  // Fetch all products from the database
  const products = await Product.findAll({
    where: whereClause,
    limit: itemsPerPage,
    offset: offset,
  });

  // Fetch totalRating and ratingCount for each product concurrently
  const fetchAttributesPromises = products.map(async (product) => {
    const [totalRating, ratingCount] = await Promise.all([
      product.get('totalRating'),
      product.get('ratingCount'),
    ]);

    // Return a simplified product object
    return {
      ...product.dataValues,
      totalRating,
      ratingCount,
    };
  });

  // Wait for all promises to resolve
  const productsWithReview = await Promise.all(fetchAttributesPromises);

  // Fetching the number of products and pages to return in the response
  const productsCount = await Product.count();
  const totalPages = Math.ceil(productsCount / itemsPerPage);

  // Log the successful retrieval and send a response with the products
  console.log('Products are fetched');
  res.status(200).json({
    success: true,
    message: 'Products fetched successfully',
    pagination: {
      currentPage: page,
      itemsPerPage: itemsPerPage,
      totalProducts: productsCount,
      totalPages: totalPages,
    },
    data: productsWithReview,
  });
});

// /**
//  * Retrieves a single product by ID from the database.
//  * @param {Object} req - Express request object.
//  * @param {Object} res - Express response object.
//  * @param {function} next - Express next middleware function.
//  */
// const getProduct = asyncWrapper(async (req, res, next) => {
//   // Extract product ID from request parameters
//   const id = Number(req.params.id);

//   // Find the product by ID in the database
//   const product = await Product.findByPk(id);

//   // If the product is found, send a success response; otherwise, invoke the next middleware with a custom error
//   if (product) {
//     return res.status(200).json({
//       success: true,
//       message: 'Product fetched successfully',
//       data: product,
//     });
//   } else {
//     return next(createCustomError(`No product with id: ${id} is found`, 404));
//   }
// });

/**
 * Retrieves a single product by ID from the database along with its ratingReviews.
 * @param {Object} req - Express request object.
 * @param {Object} res - Express response object.
 * @param {function} next - Express next middleware function.
 */
const getProduct = asyncWrapper(async (req, res, next) => {
  // Extract product ID from request parameters
  const id = Number(req.params.id);

  // Find the product by ID in the database
  const product = await Product.findByPk(id);

  // If the product is found, fetch all ratingReviews associated with the product
  if (product) {
    const ratingReviews = await RatingReview.findAll({
      where: { productId: id },
    });

    const totalRating = await product.totalRating;
    const ratingCount = await product.ratingCount;

    // Send a response with product and associated ratingReviews
    return res.status(200).json({
      success: true,
      message: 'Product and RatingReviews fetched successfully',
      data: {
        product: { ...product.dataValues, totalRating, ratingCount },
        ratingReviews,
      },
    });
  } else {
    // If the product is not found, invoke the next middleware with a custom error
    return next(createCustomError(`No product with id: ${id} is found`, 404));
  }
});

/**
 * Updates a product by ID in the database.
 * @param {Object} req - Express request object.
 * @param {Object} res - Express response object.
 * @param {function} next - Express next middleware function.
 */
const updateProduct = asyncWrapper(async (req, res, next) => {
  // Extract product ID from request parameters
  const id = Number(req.params.id);

  // Destructure product properties from the request body
  const {
    title,
    description,
    price,
    availableInStock,
    totalRating,
    ratingCount,
    imageUrl,
    categoryId,
    brandId,
  } = req.body;

  // Update the product in the database
  const [updatedRowCount] = await Product.update(
    {
      title,
      description,
      price,
      availableInStock,
      totalRating,
      ratingCount,
      imageUrl,
      categoryId,
      brandId,
    },
    { where: { id } }
  );

  // If no rows are updated, invoke the next middleware with a custom error; otherwise, fetch the updated product and send a success response
  if (updatedRowCount === 0) {
    return next(createCustomError(`No product with id: ${id} is found`, 404));
  }

  const updatedProduct = await Product.findByPk(id);
  console.log('Updated product: ', updatedProduct?.title);
  res.status(200).json({
    success: true,
    message: 'Product updated successfully',
    data: updatedProduct,
  });
});

/**
 * Deletes a product by ID from the database.
 * @param {Object} req - Express request object.
 * @param {Object} res - Express response object.
 * @param {function} next - Express next middleware function.
 */
const deleteProduct = asyncWrapper(async (req, res, next) => {
  // Extract product ID from request parameters
  const id = Number(req.params.id);

  // Delete the product from the database
  const deletedRowCount = await Product.destroy({ where: { id } });

  // If no rows are deleted, invoke the next middleware with a custom error; otherwise, log the deletion and send a success response
  if (deletedRowCount === 0) {
    return next(createCustomError(`No product with id: ${id} is found`, 404));
  }

  console.log('Deleted product: ', deletedRowCount);
  res.status(200).json({
    success: true,
    message: 'Product deleted successfully',
  });
});

/**
 * Searches products by keyword or category in the database.
 * @param {Object} req - Express request object.
 * @param {Object} res - Express response object.s
 */
const searchProducts = asyncWrapper(async (req, res) => {
  // Extract keyword and category from query parameters
  const keyword = req.query.keyword;
  const categoryName = req.query.name;

  // Check if at least one of the parameters is provided
  if (!keyword && !categoryName) {
    return res.status(400).json({
      success: false,
      error: 'Keyword or category parameter is required for search',
    });
  }

  // Define search criteria based on provided parameters
  const searchCriteria = {
    where: {
      [Op.or]: [
        { title: { [Op.like]: `%${keyword}%` } },
        { description: { [Op.like]: `%${keyword}%` } },
        { categoryId: { [Op.like]: `%${categoryName}%` } },
      ],
    },
  };

  // Search for products matching the criteria
  const products = await Product.findAll(searchCriteria);

  // Log the products matching the keyword or category and send a response
  console.log(
    `Products matching keyword '${keyword}' or category '${categoryName}': `,
    products
  );
  res.status(200).json({
    success: true,
    message: 'Operation successful',
    data: products,
  });
});

/**
 * Retrieves all ratingRevies for a product from the database.
 * @param {Object} req - Express request object.
 * @param {Object} res - Express response object.
 * @param {function} next - Express next middleware function.
 */
const getProductRatingReviews = asyncWrapper(async (req, res, next) => {
  // Extract product ID from request parameters
  const productId = Number(req.params.id);

  // Find the product by ID in the database
  const product = await Product.findByPk(productId);

  // If the product is not found, invoke the next middleware with a custom error
  if (!product) {
    return next(
      createCustomError(`No product with id: ${productId} is found`, 404)
    );
  }

  // Fetch all ratingReviews associated with the product
  const ratingReviews = await RatingReview.findAll({ where: { productId } });

  // Send a response with product and associated ratingReviews
  return res.json({
    success: true,
    message: 'Product and RatingReview fetched successfully',
    data: { product: productId, ratingReviews: ratingReviews },
  });
});

// Export the API functions
module.exports = {
  createProduct,
  getProducts,
  getProduct,
  updateProduct,
  deleteProduct,
  searchProducts,
  getProductRatingReviews,
};
