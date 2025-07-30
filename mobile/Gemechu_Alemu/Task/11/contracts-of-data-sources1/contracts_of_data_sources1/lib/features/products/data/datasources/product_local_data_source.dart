import '../models/product_model.dart';

abstract class ProductLocalDataSource {
  Future<void> cacheProducts(List<ProductModel> products);
  Future<List<ProductModel>> getCachedProducts();
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    // TODO: Save to local storage (e.g. shared preferences, database)
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getCachedProducts() async {
    // TODO: Retrieve from local storage
    throw UnimplementedError();
  }
}
