# 🧱 Clean Architecture – Domain Layer Implementation (Product CRUD)

This module implements the **Product Entity**, **CRUD Use Cases**, and 
**Repository** logic for the eCommerce app using **Clean Architecture** and **TDD** principles.

---

## ✅ What Has Been Implemented

### 📌 Entity

- Defined in: `domain/entities/product.dart`
- Fields: `id`, `name`, `description`, `price`, `imageUrl`
- Fully tested: `test/domain/entities/product_test.dart`

---

### 📌 Use Cases

Each use case is implemented using a `call()` method and located in `domain/usecases/`:

| File                                | Purpose              |
|-------------------------------------|-----------------------|
| `insert_product_usecase.dart`       | Insert a product      |
| `update_product_usecase.dart`       | Update a product      |
| `delete_product_usecase.dart`       | Delete a product      |
| `get_product_usecase.dart`          | Retrieve a product    |

- Fully unit tested in: `test/domain/usecases/`
- Shared testing tools in:
  - `usecase_test_helper.dart`
  - `usecase_test_helper.mocks.dart`

---

### 📌 Repositories

- Interface: `domain/repositories/product_repository.dart`
- Implementation: `data/repositories/product_repository_impl.dart`
- Delegates correctly to use cases and handles errors via `core/error`
- Tested in: `test/data/repositories/product_repository_impl_test.dart`

---

### 📌 Error Handling (Core)

- Custom failure/exception classes:
  - `core/error/exceptions.dart`
  - `core/error/failures.dart`
- Tested in: `test/core/error/failure_test.dart`

---

### 📌 Testing (TDD)

- Full unit test coverage for:
  - Entity
  - Use cases
  - Repository
  - Error handling
- Mocking is used for isolation where required.

---

## 📁 Folder Structure

```
┣ 📂lib
┃ ┣ 📂core
┃ ┃ ┗ 📂error
┃ ┃   ┣ 📜exceptions.dart
┃ ┃   ┗ 📜failures.dart
┃ ┣ 📂data
┃ ┃ ┣ 📂models
┃ ┃ ┃ ┗ 📜product_model.dart
┃ ┃ ┗ 📂repositories
┃ ┃   ┗ 📜product_repository_impl.dart
┃ ┣ 📂domain
┃ ┃ ┣ 📂entities
┃ ┃ ┃ ┗ 📜product.dart
┃ ┃ ┣ 📂repositories
┃ ┃ ┃ ┗ 📜product_repository.dart
┃ ┃ ┗ 📂usecases
┃ ┃   ┣ 📜delete_product_usecase.dart
┃ ┃   ┣ 📜get_product_usecase.dart
┃ ┃   ┣ 📜insert_product_usecase.dart
┃ ┃   ┗ 📜update_product_usecase.dart
┃ ┣ 📂presentation
┃ ┃ ┣ 📂common
┃ ┃ ┃ ┣ 📂themes
┃ ┃ ┃ ┃ ┣ 📜app_colors.dart
┃ ┃ ┃ ┃ ┗ 📜text_styles.dart
┃ ┃ ┃ ┗ 📂widgets
┃ ┃ ┃   ┣ 📜icons_box.dart
┃ ┃ ┃   ┣ 📜input_inserted.dart
┃ ┃ ┃   ┗ 📜input_type_name.dart
┃ ┃ ┣ 📜components
┃ ┃ ┣ 📜pages
┃ ┃ ┗ 📜product_models
┃ ┗ 📜main.dart

```

## for test
```
📂test
┃ ┣ 📂test
┃ ┃ ┣ 📂core
┃ ┃ ┃ ┗ 📂error
┃ ┃ ┃   ┗ 📜failure_test.dart
┃ ┃ ┣ 📂data
┃ ┃ ┃ ┣ 📂datasources
┃ ┃ ┃ ┃ ┗ 📜product_remote_datasource_test.dart
┃ ┃ ┃ ┗ 📂repositories
┃ ┃ ┃   ┗ 📜product_repository_impl_test.dart
┃ ┃ ┗ 📂domain
┃ ┃   ┣ 📂entities
┃ ┃   ┃ ┗ 📜product_test.dart
┃ ┃   ┗ 📂usecases
┃ ┃     ┣ 📜delete_product_usecase_test.dart
┃ ┃     ┣ 📜get_product_usecase_test.dart
┃ ┃     ┣ 📜insert_product_usecase_test.dart
┃ ┃     ┣ 📜update_product_usecase_test.dart
┃ ┃     ┣ 📜usecase_test_helper.dart
┃ ┃     ┗ 📜usecase_test_helper.mocks.dart
┃ ┗ 📜widget_test.dart

```

---

## 🧼 Code Quality

- Clean file naming and architecture
- Fully separated concerns by layer
- All logic testable and documented
- Followed Dart/Flutter best practices

---
