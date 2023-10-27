const asyncWrapper = (fn) => {
    return async (req, res, next) => {
        try {
            await fn(req, res, next);
        } catch (error) {
            next(error);
        }
    };
};

module.exports = asyncWrapper;


// const asyncWrapper = (asyncFunction) => {
//     return (req, res, next) => {
//         try {
//             asyncFunction(req, res, next).catch(next);
//         } catch (error) {
//             next(error);
//         }
//     };
// };

// module.exports = asyncWrapper;
