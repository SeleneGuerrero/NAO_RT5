# Order Management System

**REST API for managing customers, products, and orders in an online store. Built with Spring Boot, Spring Data JPA, and MySQL.**



## Technologies & Dependencies
**Core Framework**

- spring-boot-starter — Base Spring Boot features
- spring-boot-starter-web — REST controllers
- spring-boot-starter-data-jpa — Persistence layer with JPA/Hibernate

**Database**

- mysql-connector-j — Driver for connecting to MySQL

**Validation**

- jakarta.validation-api — Annotations such as @NotNull, @Email, etc.

**Utilities**

lombok — Reduces boilerplate (getters, setters, constructors)

**Testing**

- spring-boot-starter-test — JUnit, Mockito, etc.
- junit:junit — Additional JUnit support


## Project Structure
```
src/main/java
└── com.ordermanagement.orderapp
    ├── controller          → REST controllers (Customer, Product, Order)
    ├── dto                 → DTOs for requests/responses
    ├── entity              → JPA entities (Customer, Product, Order, OrderItem)
    ├── repository          → Spring Data repositories
    ├── service             → Business logic layer
    └── OrderappApplication → Main entry point
```


**Controllers**

- CustomerController — CRUD operations for customers
- ProductController — CRUD for products
- OrderController — Order creation and listing

**DTOs**

- OrderCreatedDTO — Used to create new orders
- OrderItemDTO — Represents products inside an order
- OrderResponseDTO — Standardized order response model

**Entities**

- Customer
- Product
- Order
- OrderItem

**Repositories**

Interfaces extending JpaRepository, auto-implemented by Spring:

- CustomerRepository
- ProductRepository
- OrderRepository
- OrderItemRepository

**Services**

Contains business rules and validations:
- CustomerService
- ProductService
- OrderService


## Main Endpoints (General Overview)
| Resource  | Method | Endpoint       | Description       |
| --------- | ------ | -------------- | ----------------- |
| Customers | GET    | `/customers`   | List customers    |
|           | POST   | `/customers`   | Create customer   |
| Products  | GET    | `/products`    | List products     |
|           | POST   | `/products`    | Add product       |
| Orders    | POST   | `/orders`      | Create new order  |
|           | GET    | `/orders/{id}` | Get order details |

## Testing

Unit tests are located in:
```
src/test/java/com.ordermanagement.orderapp
```


## Tech Stack
- **Springboot 3.6**
- **MySQL  8.0**
- **Swagger**
- **Postman (API Testing)**
- **JUnit 4.13**
---

## License

MIT License © 2025 Luis Alberto García López
