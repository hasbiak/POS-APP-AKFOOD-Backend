const connection = require("../config/mysql");

module.exports = {
  postOrder: (setData) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "INSERT INTO history SET ?",
        setData,
        (error, result) => {
          if (!error) {
            const newResult = {
              history_id: result.insertId,
              ...setData,
            };
            resolve(newResult);
          } else {
            reject(new Error(error));
          }
        }
      );
    });
  },
  ordersHistory: (id) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "SELECT * FROM product WHERE product_id = ?",
        id,
        (error, result) => {
          !error ? resolve(result) : reject(new Error(error));
        }
      );
    });
  },
  postOrders: (setData2) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "INSERT INTO orders SET ?",
        setData2,
        (error, result) => {
          if (!error) {
            const newResult = {
              orders_id: result.insertId,
              ...setData2,
            };
            resolve(newResult);
          } else {
            reject(new Error(error));
          }
        }
      );
    });
  },
  getSubTotal: (i) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "SELECT SUM(orders_total) FROM orders WHERE history_id = ?",
        i,
        (error, result) => {
          !error ? resolve(result) : reject(new Error(error));
        }
      );
    });
  },
  patchHistory: (setData3, d) => {
    return new Promise((resolve, reject) => {
      connection.query(
        "UPDATE history SET ? WHERE history_id = ?",
        [setData3, d],
        (error, result) => {
          if (!error) {
            const newResult = {
              history_id: d,
              ...setData3,
            };
            resolve(newResult);
          } else {
            reject(new Error(error));
          }
        }
      );
    });
  },
};
