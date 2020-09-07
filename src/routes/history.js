const router = require("express").Router();
const {
  getAllHistory,
  getHistoryById,
  postHistory,
  CheckOut,
  patchHistory,
} = require("../controller/history");
const { authorization } = require("../middleware/auth");
const {
  getHistoryByIdRedis,
  clearDataHistoryRedis,
  getHistoryRedis,
} = require("../middleware/redis");

router.get("/", authorization, getHistoryRedis, getAllHistory);
router.get("/:id", authorization, getHistoryByIdRedis, getHistoryById);

router.post("/", authorization, postHistory);
router.post("/CheckOut", authorization, CheckOut);

router.patch("/:id", authorization, clearDataHistoryRedis, patchHistory);

module.exports = router;
