// Import object from model
const {
  getAllHistory,
  getHistoryCount,
  getHistoryById
} = require('../model/history')

// Import query string
const queryStrings = require('querystring')

// Import helper
const helper = require('../helper')

// Pagination
const getPrevLink = (page, currentQuery) => {
  if (page > 1) {
    const generatePage = {
      page: page - 1
    }
    const resultPrevLink = { ...currentQuery, ...generatePage }
    return queryStrings.stringify(resultPrevLink)
  } else {
    return null
  }
}

const getNextLink = (page, totalPage, currentQuery) => {
  if (page < totalPage) {
    const generatePage = {
      page: page + 1
    }
    const resultPrevLink = { ...currentQuery, ...generatePage }
    return queryStrings.stringify(resultPrevLink)
  } else {
    return null
  }
}

module.exports = {
  getAllHistory: async (request, response) => {
    let { page, limit, sort } = request.query
    page === undefined ? page = 1 : page = parseInt(page)
    limit === undefined ? limit = 3 : limit = parseInt(limit)
    if (sort === undefined) {
      sort = 'history_id'
    }
    const totalData = await getHistoryCount()
    const totalPage = Math.ceil(totalData / limit)
    const offset = page * limit - limit
    const prevLink = getPrevLink(page, request.query)
    const nextLink = getNextLink(page, totalPage, request.query)
    const pageInfo = {
      page,
      totalPage,
      limit,
      totalData,
      prevLink: prevLink && `http://127.0.0.1:3001/history?${prevLink}`,
      nextLink: nextLink && `http://127.0.0.1:3001/history?${nextLink}`
    }
    try {
      const result = await getAllHistory(limit, offset, sort)
      if (result.length > 0) {
        return helper.response(response, 200, 'Success Get History', result, pageInfo)
      } else {
        return helper.response(response, 404, 'History not found', result, pageInfo)
      }
    } catch (error) {
      return helper.response(response, 400, 'Bad Request', error)
    }
  },
  getHistoryById: async (request, response) => {
    try {
      const { id } = request.params
      const dataHistory = await getHistoryById(id)
      let total = 0
      
      const tax = total * 10 / 100
      const result = {
        history_id: dataHistory[0].history_id,
        invoice: dataHistory[0].history_invoice,
        tax,
        subtotal: dataHistory[0].history_subtotal,
        history_created_at: dataHistory[0].history_created_at
      }
      return helper.response(response, 200, `Get History id: ${id} Success`, result)
    } catch (error) {
      return helper.response(response, 400, 'Bad Request', error)
    }
  }
}
