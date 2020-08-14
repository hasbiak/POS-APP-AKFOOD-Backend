const connection = require('../config/mysql')

module.exports = {
  getProduct: (limit , offset) => {
      return new Promise((resolve, reject) => {
        connection.query("SELECT * FROM product LIMIT 2 OFFSET 0", (error, result) => {
          !error ? resolve(result) : reject(new Error(error))
        })
      })
  },
  getProductCount: () =>{
    return new Promise((resolve, reject)=>{
      connection.query("SELECT COUNT(*) as total FROM product", (error,result)=>{
        !error ? resolve(result) : reject(new Error(error))
      })
    })
  },
  getProductById: (id) => {
    return new Promise((resolve, reject)=>{
      connection.query("SELECT * FROM product WHERE product_id = ?",id,(error, result) => {
        !error ? resolve(result[0].total) : reject(new (error))
      })
    })
  },
  postProduct:(setData) => {
    return new Promise((resolve,reject)=>{
      connection.query("INSERT INTO product SET ?", setData, (error,result)=>{
        console.log(result)
        if(!error){
          const newResult = {
            product_id: result.insertId,
            ...setData
          }
          resolve(newResult)
        }else{
          reject(new (error))
        }
      })
    })
  },
  patchProduct: (setData, id) =>{{
    return new Promise((resolve,reject)=>{
      connection.query("UPDATE product SET ? WHERE product_id = ?", [setData, id],(error, result)=>{
        if(!error){
          const newResult = {
            product_id: id,
            ...setData
          }
          resolve(newResult)
        }else{
          reject(new (error))
        }
      })
    })
  }
  },
  deleteProduct:()=>{
    return new Promise((resolve, reject)=>{
      connection.query("DELETE FROM product SET ? WHERE product_id = ?", id, (error, result)=>{
        if(!error){
          const newResult = {
            product_id: result.insertId,
            ...setData
          }
          resolve(newResult)
        }else{
          reject(new (error))
        }
      })
    })
  }
}