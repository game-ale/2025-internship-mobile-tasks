import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_local_data_source.dart';
import '../datasources/product_remote_data_source.dart';
//import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProducts = await remoteDataSource.fetchAllProducts();
        await localDataSource.cacheProducts(remoteProducts);

        final products = remoteProducts.map<Product>((model) => model).toList();
        return Right(products);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localProducts = await localDataSource.getCachedProducts();

        final products = localProducts.map<Product>((model) => model).toList();
        return Right(products);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Product>> getProductById(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final productModel = await remoteDataSource.fetchProductById(id);
        return Right(productModel);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final cachedProducts = await localDataSource.getCachedProducts();
        final product = cachedProducts.firstWhere((p) => p.id == id);
        return Right(product);
      } on CacheException {
        return Left(CacheFailure());
      } catch (_) {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, void>> createProduct(Product product) async {
    
    try {
      
      return const Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> updateProduct(Product product) async {
    try {
  
      return const Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(String id) async {
    try {
     
      return const Right(null);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
