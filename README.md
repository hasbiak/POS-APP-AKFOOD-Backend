<h1 align="center">ExpressJS - AKFOOD RESTfull API</h1>

AKFOOD is web application for order some menu, there are Restfull API for product, product category, order, and history. [More about Express](https://en.wikipedia.org/wiki/Express.js)

## Built With

[![Express.js](https://img.shields.io/badge/Express.js-4.x-orange.svg?style=rounded-square)](https://expressjs.com/en/starter/installing.html)
[![Node.js](https://img.shields.io/badge/Node.js-v.12.13-green.svg?style=rounded-square)](https://nodejs.org/)

## Requirements

1. <a href="https://nodejs.org/en/download/">Node Js</a>
2. Node_modules
3. <a href="https://www.getpostman.com/">Postman</a>
4. Web Server (ex. localhost)

## How to run the app ?

1. Open app's directory in CMD or Terminal
2. Type `npm install`
3. Make new file a called **.env**, set up first [here](#set-up-env-file)
4. Turn on Web Server and MySQL can using Third-party tool like xampp, etc.
5. Create a database with the name akfood, and Import file sql to **phpmyadmin**
6. Open Postman desktop application or Chrome web app extension that has installed before
7. Choose HTTP Method and enter request url.(ex. localhost:3001/)
8. You can see all the end point [here](#end-point)

## Set up .env file

Open .env file on your favorite code editor, and copy paste this code below :

```
DB_HOST=localhost // Database Host
DB_ROOT=root // Database Root
DB_PASSWORD= // Password set for database is empty
DB_NAME=akfood // Database

DB_PORT=3001
DB_IP=127.0.0.1
```

## End Point

**1. GET**

- `/product?page=1&limit=6&sort=product_id&ascdsc=asc`(Get all product, pagination, sort, and ascdsc)

  - `{ "page": 1, limit: 6, "sort": "product_id", "ascdsc": "asc"}`

- `/product/:id` (Get product by id)

- `/category` (Get all category)

- `/category/:id` (Get category by id)

- `/order` (Get all order)

- `/order/:id` (Get order by id)

- `/history` (Get all history)

- `/history/:id` (Get history by id)

- `/users/login` (Login for user)
  - `{ "user_email": "hasbialwi70@gmail.com", "user_password": "123456"}`

**2. POST**

- `/product` (Post product)

  - `{ "product_name": "chocorum", "product_price": 15000, "category_id": 2, product_image: (choose file) , "product_status" : 1}`

- `/category` (Post category)

  - `{ "category_name": "Other", "category_status": 1}`

- `/users/register` (Register new user)
  - `{ "user_email": "hasbialwi80@gmail.com", "user_password": "12345678", "user_name": "Hasbi"}`

**3. PATCH**

- `/product/:id` (Update product by id)

  - `{ "product_name": "chocorum", "product_price": 15000, "category_id": 2, product_image: (choose file) , "product_status" : 1}`

  - `/category` (Post category)
  - `{ "category_name": "Other", "category_status": 1}`

**4. DELETE**

- `/product/:id` (Delete product by id)

- `/category/:id` (Delete category by id)

**5. SEARCH**

- `/product/search/name?name=cappuccino&limit=6` (Search product)
  - `{ "product_name": "Cappuccino"}`

**Documentation API**

https://web.postman.co/collections/12329591-c5b28761-cd7e-4a4a-96e2-3a1324169b02?version=latest&workspace=ed9da054-53e6-410a-83b5-b5aec64d38ac#511a9bbc-3ca2-4439-a8d8-de6382ef38f0
