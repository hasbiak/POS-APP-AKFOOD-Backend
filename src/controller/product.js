// Import object from model
const {
    getProduct, 
    getProductById,
    postProduct,
    patchProduct,
    deleteProduct,
    getProductCount
} = require('../model/product')
const qs = require('querystring')

// Import helper
const helper = require('../helper')
const { request } = require('express')
const { response } = require('../helper')

const getPrevLink = (page, currentQuery) =>{
if(page > 1){
    const generatePage = {
        page: page - 1
    }
    const resultPrevLink = {...currentQuery, ...generatePage}
    return qs.stringify(resultPrevLink)
}else{
    return null
}
}

const getNextLink = (page, totalPage, currentQuery) =>{
    if(page < 1){
        const generatedPage = {
            page: page - 1
        }
        const resultNextLink = {...currentQuery, ...generatedPage}
        return qs.stringify(resultNextLink)
    }else{
        return null
    }
    }
    
    
   
module.exports = {
    getAllProduct: async (request, response) => {
        let {page, limit} = request.query
            page = parseInt(page)
            limit = parseInt(limit)
            let totalData = await getProductCount();
            let totalPage = Math.ceil(totalData / limit)
            let offset = page * limit - limit
            let prevLink = getPrevLink(page, request.query)
            let nextLink = getNextLink(page, totalPage, request.query)
            const pageInfo = {
                page,
                totalPage,
                limit,
                totalData,
                prevLink: prevLink && `http://127.0.0.1:3001/product?${prevLink}`,
                nextLink: nextLink && `http://127.0.0.1:3001/product?${nextLink}`
            }
        try {
            
            const result = await getProduct(limit, offset);
                return helper.response(response, 200, 'Get Product Success', result, pageInfo)
            }catch (error) {
            return helper.response(response, 400, 'Bad Request', error)
        }
    },
    getProductById: async (request, response) => {
        try {
            const { id } = request.params
            const result = await getProductById(id)
            if (result.length > 0) {
                return helper.response(response, 200, "Get Product Success", result)
            } else {
                return helper.response(response, 404, `Product by id: ${id} not found`, result) 
            }
        } catch (error) {
            return helper.response(response, 400, "Bad Request", error)
        }
    },
    postProduct: async (request, response) => {
        try {
            const {product_name, product_image, product_price, category_id, product_status} = request.body
            const setData = {
                product_name,
                product_image,
                product_price,
                category_id,
                product_created_at: new Date(),
                product_status
            }
            const result = await postProduct(setData)
            return helper.response(response, 201, 'Product Added', result)
        } catch (error) {
            return helper.response(response, 400, 'Bad Request', error)
        }
    },
    patchProduct: async (request, response) => {
        try {
            const {id} = request.params
            const {product_name, product_image, product_price, category_id, product_status} = request.body
            const setData = {
                product_name,
                product_image,
                product_price,
                category_id,
                product_updated_at: new Date(),
                product_status
            }
            const checkId = await getProductById(id)
            if (checkId.length > 0) {
                const result = await patchProduct(setData, id)
                return helper.response(response, 201, 'Product Updated', result)
            } else {
                return helper.response(response, 404, `Product by id: ${id} Not Found`)
            }
        } catch (error) {
            return helper.response(response, 400, 'Bad Request', error)
        }
    },
    deleteProduct: async (request, response) => {
        try {
            const {id} = request.params
            const checkId = await getProductById(id)
            if (checkId.length > 0) {
                const result = await deleteProduct(id)
                return helper.response(response, 201, "Product Deleted", result)
            } else {
                return helper.response(response, 404, `Product by id: ${id} Not Found`)
            }
        } catch (error) {
            return helper.response(response, 400, 'Bad Request', error)
        }
    }
}