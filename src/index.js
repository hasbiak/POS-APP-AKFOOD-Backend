const routes = require("express").Router();

const product = require("./routes/product");
const category = require("./routes/category");
const history = require("./routes/history");
const orders = require("./routes/orders");
const users = require("./routes/users");

routes.use("/product", product);
routes.use("/category", category);
routes.use("/history", history);
routes.use("/orders", orders);
routes.use("/users", users);

module.exports = routes;
