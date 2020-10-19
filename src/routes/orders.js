const router = require("express").Router();
const { postOrder } = require("../controller/orders");
const { authorization } = require("../middleware/auth");
const { clearDataHistoryRedis } = require("../middleware/redis");

router.post("/", authorization, clearDataHistoryRedis, postOrder);

module.exports = router;
