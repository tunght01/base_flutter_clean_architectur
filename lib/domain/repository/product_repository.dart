import 'package:soft_dream_test/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getAll({String? query, bool? inStockOnly});

  Future<ProductEntity> create(ProductEntity product);

  Future<ProductEntity?> getById(String id);

  Future<ProductEntity> update(ProductEntity product);

  Future<void> delete(String id);

  Future<void> seedIfEmpty();
}