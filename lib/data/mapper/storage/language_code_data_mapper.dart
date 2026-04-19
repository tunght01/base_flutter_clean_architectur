import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/data/mapper/base/base_data_mapper.dart';
import 'package:soft_dream_test/shared/utils/enums/app_enum.dart';

@Injectable()
class LanguageCodeDataMapper extends BaseDataMapper<String, LanguageCode>
    with DataMapperMixin {
  @override
  LanguageCode mapToEntity(String? data) {
    return LanguageCode.values.firstOrNullWhere(
          (element) => element.localeCode == data,
        ) ??
        LanguageCode.defaultValue;
  }

  @override
  String mapToData(LanguageCode entity) {
    return entity.localeCode;
  }
}
