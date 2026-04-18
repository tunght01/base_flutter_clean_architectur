import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/data/mapper/base/base_data_mapper.dart';
import 'package:soft_dream_test/data/model/account_info_model.dart';
import 'package:soft_dream_test/domain/entities/account_info.dart';

@injectable
class AccountInfoMapper extends BaseDataMapper<AccountInfoModel, AccountInfo> {
  const AccountInfoMapper();

  @override
  AccountInfo mapToEntity(AccountInfoModel model) {
    return AccountInfo(
      uid: model.uid,
      email: model.email,
      fullName: model.fullName,
      avatarUrl: model.avatarUrl,
      provider: model.provider,
      emailVerified: model.emailVerified,
      createdAt: model.createdAt ?? DateTime.now(),
      updatedAt: model.updatedAt ?? DateTime.now(),
      lastLoginAt: model.lastLoginAt ?? DateTime.now(),
      termsAcceptedAt: model.termsAcceptedAt,
    );
  }
}
