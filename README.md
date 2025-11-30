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
│   │       └── application.properties
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
```

**2. Build and run**
```
mvn clean install
mvn spring-boot:run
```
---
## API Endpoints (General Overview)

**Customers**

| Method | Endpoint          | Description        |
| ------ | ----------------- | ------------------ |
| GET    | `/customers`      | List all customers |
| POST   | `/customers`      | Create customer    |
| GET    | `/customers/{id}` | Get customer by ID |


**Products**
| Method | Endpoint    | Description    |
| ------ | ----------- | -------------- |
| GET    | `/products` | List products  |
| POST   | `/products` | Create product |


**Orders**
| Method | Endpoint       | Description       |
| ------ | -------------- | ----------------- |
| POST   | `/orders`      | Create order      |
| GET    | `/orders/{id}` | Get order details |

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
