import 'package:dartz/dartz.dart';
import 'package:fruitsecommerce/core/entities/product_entity.dart';
import 'package:fruitsecommerce/core/errors/Failures.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();

  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
}
