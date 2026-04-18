import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/data/mapper/product_mapper.dart';
import 'package:soft_dream_test/data/repository/source/database/hive/product_local_data_source_hive.dart';
import 'package:soft_dream_test/domain/entities/product_entity.dart';
import 'package:soft_dream_test/domain/repository/product_repository.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSourceHive _productLocalDataSource;

  /// mapper
  final ProductMapper _productMapper;

  ProductRepositoryImpl(this._productLocalDataSource, this._productMapper);

  @override
  Future<ProductEntity> create(ProductEntity product) async {
    final modelHive = _productMapper.mapToData(product);
    final response = await _productLocalDataSource.create(modelHive);
    return _productMapper.mapToEntity(response);
  }

  @override
  Future<void> delete(String id) async {
    await _productLocalDataSource.delete(id);
  }

  @override
  Future<List<ProductEntity>> getAll({String? query, bool? inStockOnly}) async {
    final response = await _productLocalDataSource.getAll(
      query: query,
      inStockOnly: inStockOnly,
    );
    return _productMapper.mapToListEntity(response);
  }

  @override
  Future<ProductEntity?> getById(String id) async {
    final response = await _productLocalDataSource.getById(id);
    return _productMapper.mapToEntity(response);
  }

  @override
  Future<void> seedIfEmpty() async {
    await _productLocalDataSource.seedIfEmpty();
  }

  @override
  Future<ProductEntity> update(ProductEntity product) async {
    final hiveModel = _productMapper.mapToData(product);
    final response = await _productLocalDataSource.update(hiveModel);
    return _productMapper.mapToEntity(response);
  }
}
