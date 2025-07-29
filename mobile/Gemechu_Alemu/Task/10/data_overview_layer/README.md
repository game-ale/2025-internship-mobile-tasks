🧾 Product Domain Layer — Clean Architecture Task
This task is focused on implementing the Domain Layer of an eCommerce mobile application using Clean Architecture principles. The core business logic is defined through entities, repositories, and use cases, alongside unit tests for reliability.

📁 Folder Structure

```
lib
┣ 📂core
┃ ┗ 📂error
┃   ┣ 📜exceptions.dart
┃   ┗ 📜failure.dart
┣ 📂features
┃ ┗ 📂products
┃   ┣ 📂data
┃   ┃ ┗ 📂models
┃   ┃   ┗ 📜product_model.dart
┃   ┗ 📂domain
┃     ┣ 📂entities
┃     ┃ ┗ 📜product.dart
┃     ┣ 📂repositories
┃     ┃ ┗ 📜product_repository.dart
┃     ┗ 📂usecases
┃       ┣ 📜create_product.dart
┃       ┣ 📜delete_product.dart
┃       ┣ 📜update_product.dart
┃       ┣ 📜view_all_products.dart
┃       ┗ 📜view_product.dart
┗ 📜main.dart
```

for test 

```
test
┣ 📂core
┃ ┗ 📂error
┃   ┣ 📜exceptions_test.dart
┃   ┗ 📜failure_test.dart
┣ 📂features
┃ ┗ 📂products
┃   ┣ 📂data
┃   ┃ ┗ 📂models
┃   ┃   ┗ 📜product_model_test.dart
┃   ┗ 📂domain
┃     ┣ 📂entities
┃     ┃ ┗ 📜product_test.dart
┃     ┣ 📂repositories
┃     ┃ ┗ 📜product_repository_test.dart
┃     ┗ 📂usecases
┃       ┣ 📜create_product_test.dart
┃       ┣ 📜delete_product_test.dart
┃       ┣ 📜update_product_test.dart
┃       ┣ 📜view_all_products_test.dart
┃       ┗ 📜view_product_test.dart
┣ 📂mocks
┃ ┣ 📜mock_product_repository.dart
┃ ┗ 📜mock_product_repository.mocks.dart
┗ 📜widget_test.dart
```
✅ What’s Implemented

🧩 Entity
Product: Core domain model with fields like id, name, description, price, and imageUrl.

📂 Repository Interface
ProductRepository: Abstract contract defining the following methods:

getAllProducts()

getProductById(String id)

createProduct(Product product)

updateProduct(Product product)

deleteProduct(String id)

🧠 Use Cases
ViewAllProducts

ViewProduct

CreateProduct

UpdateProduct

DeleteProduct

Each use case receives the ProductRepository via constructor injection and exposes a call() method to execute the logic.

🧪 Unit Testing
✅ Tests Implemented
CreateProduct — verifies interaction with createProduct()

ViewProduct — verifies interaction with getProductById()

🛠 Mocking
Used mockito to create MockProductRepository and verify behavior.

class MockProductRepository extends Mock implements ProductRepository {}
💡 Technologies Used
Dart & Flutter

Clean Architecture

Mockito for mocking dependencies

Flutter Test for writing unit tests


