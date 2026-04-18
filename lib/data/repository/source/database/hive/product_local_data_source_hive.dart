import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/data/repository/source/database/hive/model/product_hive_model.dart';
import 'package:hive_ce/hive.dart';
import 'package:soft_dream_test/shared/constants/hive_constant.dart';

@LazySingleton()
class ProductLocalDataSourceHive {
  ProductLocalDataSourceHive();

  Future<ProductHiveModel?> create(ProductHiveModel product) async {
    final tasksBox = Hive.box<ProductHiveModel>(HiveConstant.productBox);

    await tasksBox.put(product.id, product);

    return await getById(product.id!);
  }

  Future<void> delete(String id) async {
    final tasksBox = Hive.box<ProductHiveModel>(HiveConstant.productBox);
    await tasksBox.delete(id);
  }

  Future<List<ProductHiveModel>> getAll({
    String? query,
    bool? inStockOnly,
  }) async {
    final tasksBox = Hive.box<ProductHiveModel>(HiveConstant.productBox);
    var list = tasksBox.values.toList();

    if (query != null && query.isNotEmpty) {
      list = list
          .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    if (inStockOnly != null && inStockOnly) {
      list = list.where((p) => p.inStock).toList();
    }

    return list;
  }

  Future<ProductHiveModel?> getById(String id) async {
    final tasksBox = Hive.box<ProductHiveModel>(HiveConstant.productBox);
    final hiveModel = tasksBox.get(id);
    if (hiveModel != null) {
      return hiveModel;
    }
    return null;
  }

  Future<ProductHiveModel> update(ProductHiveModel product) async {
    final tasksBox = Hive.box<ProductHiveModel>(HiveConstant.productBox);
    await tasksBox.put(product.id, product);
    return product;
  }

  Future<void> seedIfEmpty() async {
    final tasksBox = Hive.box<ProductHiveModel>(HiveConstant.productBox);
    if (tasksBox.isEmpty) {
      for (var item in ProductHiveModel.defaultItems) {
        await create(item);
      }
    }
  }
}
