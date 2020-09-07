const router = require("express").Router();
const {
  getAllCategory,
  getCategoryById,
  postCategory,
  patchCategory,
  deleteCategory,
} = require("../controller/category");
const { authorization } = require("../middleware/auth");
const {
  getCategoryByIdRedis,
  clearDataCategoryRedis,
  getCategoryRedis,
} = require("../middleware/redis");

router.get("/", authorization, getAllCategory);
router.get("/:id", authorization, getCategoryByIdRedis, getCategoryById);

router.post("/", postCategory);

router.patch("/:id", authorization, clearDataCategoryRedis, patchCategory);

router.delete("/:id", authorization, clearDataCategoryRedis, deleteCategory);

module.exports = router;
