# Order Management System

REST API built with Spring Boot, MySQL, and Spring Data JPA to manage customers, products, and orders in an online store.

---

## Technologies Used

**Backend**

- Java 17
- Spring Boot: spring-boot-starter, spring-boot-starter-web, spring-boot-starter-data-jpa

**Database**

- MySQL (mysql-connector-j:8.2.0)

**Utilities**

- Lombok
- Jakarta Validation (Bean Validation API)

**Testing**

- Spring Boot Starter Test
- JUnit

---

## Project Structure

```
OrderManagement-challenge5/
│
├── .idea/
├── .mvn/
│
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── ordermanagement/
│   │   │           └── orderapp/
│   │   │               ├── controller/
│   │   │               │   ├── CustomerController.java
│   │   │               │   ├── OrderController.java
│   │   │               │   └── ProductController.java
│   │   │               │
│   │   │               ├── dto/
│   │   │               │   ├── OrderCreatedDTO.java
│   │   │               │   ├── OrderItemDTO.java
│   │   │               │   └── OrderResponseDTO.java
│   │   │               │
│   │   │               ├── entity/
│   │   │               │   ├── Customer.java
│   │   │               │   ├── Order.java
│   │   │               │   ├── OrderItem.java
│   │   │               │   └── Product.java
│   │   │               │
│   │   │               ├── exception/
│   │   │               │   ├──ErrorResponse
│   │   │               │   └── GlobalExceptionHandler
│   │   │               │
│   │   │               ├── repository/
│   │   │               │   ├── CustomerRepository.java
│   │   │               │   ├── OrderItemRepository.java
│   │   │               │   ├── OrderRepository.java
│   │   │               │   └── ProductRepository.java
│   │   │               │
│   │   │               ├── service/
│   │   │               │   ├── CustomerService.java
│   │   │               │   ├── OrderService.java
│   │   │               │   └── ProductService.java
│   │   │               │
│   │   │               └── OrderappApplication.java
│   │   │
│   │   └── resources/
│   │       ├── application.yml
│   │       ├── application-dev.yml
│   │       ├── application-prod.yml
│   │       ├── application-test.yml
│   │       └── application.yml
│   │
│   └── test/
│       └── java/
│           └── com/
│               └── ordermanagement/
│                   └── orderapp/
│                       └── OrderappApplicationTests.java
│
├── target/
│
├── mvnw
├── mvnw.cmd
├── .gitignore
├── .gitattributes
└── pom.xml

```
---
## How to Run the Project

**1. Create database in MySQL**

```
CREATE DATABASE online_store_dev;
CREATE DATABASE online_store_prod;
```

**2. Build and run**
```
mvn clean install
mvn spring-boot:run
```
---
## API Endpoints (General Overview)

**Customer**

| Method     | Endpoint                           | Description                  |
| ---------- | ---------------------------------- | ---------------------------- |
| **POST**   | `/api/products`                    | Create a new product.        |
| **GET**    | `/api/products`                    | Get all products.            |
| **GET**    | `/api/products?activeOnly=true`    | Get only active products.    |
| **GET**    | `/api/products/{productId}`        | Get product by ID.           |
| **GET**    | `/api/products/search?name={text}` | Search for products by name. |
| **PUT**    | `/api/products/{productId}`        | Update product information.  |
| **DELETE** | `/api/products/{productId}`        | Delete a product.            |




**Products**
| Method     | Endpoint                           | Description                  |
| ---------- | ---------------------------------- | ---------------------------- |
| **POST**   | `/api/products`                    | Create a new product.        |
| **GET**    | `/api/products`                    | Get all products.            |
| **GET**    | `/api/products?activeOnly=true`    | Get only active products.    |
| **GET**    | `/api/products/{productId}`        | Get product by ID.           |
| **GET**    | `/api/products/search?name={text}` | Search for products by name. |
| **PUT**    | `/api/products/{productId}`        | Update product information.  |
| **DELETE** | `/api/products/{productId}`        | Delete a product.            |


**Orders**
| Method     | Endpoint                                         | Description                                   |
| ---------- | ------------------------------------------------ | --------------------------------------------- |
| **POST**   | `/api/orders`                                    | Create a new order with items.                |
| **GET**    | `/api/orders`                                    | Get all orders.                               |
| **GET**    | `/api/orders/{orderId}`                          | Get order details by ID.                      |
| **GET**    | `/api/orders/customer/{customerId}`              | Get all orders placed by a specific customer. |
| **PATCH**  | `/api/orders/{orderId}/status?status=CONFIRMED`  | Update order status → CONFIRMED.              |
| **PATCH**  | `/api/orders/{orderId}/status?status=PROCESSING` | Update order status → PROCESSING.             |
| **PATCH**  | `/api/orders/{orderId}/status?status=SHIPPED`    | Update order status → SHIPPED.                |
| **PATCH**  | `/api/orders/{orderId}/status?status=DELIVERED`  | Update order status → DELIVERED.              |
| **PATCH**  | `/api/orders/{orderId}/status?status=CANCELLED`  | Cancel order (status → CANCELLED).            |
| **DELETE** | `/api/orders/{orderId}`                          | Delete an order (only PENDING or CANCELLED).  |


---
## Tech Stack
- **Springboot 3.6**
- **MySQL 8.0**
- **Swagger**
- **Postman (API Testing)**
- **JUnit 4.13**
---

## License

MIT License © 2025 
