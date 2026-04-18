import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/data/mapper/base/base_data_mapper.dart';
import 'package:soft_dream_test/data/repository/source/database/hive/model/product_hive_model.dart';
import 'package:soft_dream_test/domain/entities/product_entity.dart';
import 'package:soft_dream_test/shared/constants/data_constant.dart';
import 'package:soft_dream_test/shared/utils/date_time_utils.dart';

@Injectable()
class ProductMapper extends BaseDataMapper<ProductHiveModel, ProductEntity>
    with DataMapperMixin {
  @override
  ProductEntity mapToEntity(ProductHiveModel? data) {
    return ProductEntity(
      id: data?.id ?? DataConstant.defaultString,
      name: data?.name ?? DataConstant.defaultString,
      price: data?.price ?? DataConstant.defaultDouble,
      inStock: data?.inStock ?? DataConstant.defaultBool,
      description: data?.description ?? DataConstant.defaultString,
      createdAt: data?.createdAt ?? DateTimeUtils.dateRandom,
      updatedAt: data?.updatedAt ?? DateTimeUtils.dateRandom,
    );
  }

  @override
  ProductHiveModel mapToData(ProductEntity entity) {
    return ProductHiveModel(
      id: entity.id,
      name: entity.name,
      price: entity.price,
      inStock: entity.inStock,
      description: entity.description,
      createdAt: entity.createdAt,

      updatedAt: entity.updatedAt,
    );
  }
}
