const { createCustomError } = require('../utils/errors/custom-error');

/**
 * Check if the current page number is within the valid range.
 * @param {number} currentPage - The current page number.
 * @param {number} totalPages - The total number of pages.
 * @returns {boolean} - True if the page is valid, or a false if not.
 */
const checkPage = (currentPage, totalPages) => {
  if (currentPage > totalPages) {
    return false;
  }
  return true;
};

/**
 * Paginate data from a Sequelize model using the provided options.
 * @param {Sequelize.Model} model - The Sequelize model to query.
 * @param {object} options - Additional query options.
 * @param {number} page - The current page number.
 * @param {number} limit - The maximum number of items per page.
 * @returns {object|Error} - Paginated data or a custom error if the page is invalid.
 */
const paginateModelData = async (model, options, page, limit) => {
  const { count, rows } = await model.findAndCountAll({
    ...options,
    limit,
    offset: (page - 1) * limit,
  });

  const totalPages = Math.ceil(count / limit);

  if (!checkPage(page, totalPages)) {
    return createCustomError(`Page not Found!`, 404);
  }

  return {
    data: rows,
    currentPage: page,
    itemsPerPage: limit,
    totalPages,
    previousPage: page > 1 ? page - 1 : null,
    nextPage: page < count ? page + 1 : null,
  };
};

/**
 * Paginate an array of data.
 * @param {Array} data - The array of data to paginate.
 * @param {number} page - The current page number.
 * @param {number} limit - The maximum number of items per page.
 * @returns {object|Error} - Paginated data or a custom error if the page is invalid.
 */
const paginateArrayData = (data, page, limit) => {
  const offset = (page - 1) * limit;
  const totalPages = Math.ceil(data.length / limit);

  if (!checkPage(page, totalPages)) {
    return createCustomError(`Page not Found!`, 404);
  }

  const result = data.slice(offset, offset + limit);
  return {
    data: result,
    currentPage: page,
    itemsPerPage: limit,
    totalPages,
    previousPage: page > 1 ? page - 1 : null,
    nextPage: page < totalPages ? page + 1 : null,
  };
};

module.exports = {
  paginateModelData,
  paginateArrayData,
};
