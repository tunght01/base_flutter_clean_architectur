import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/entities/account_info.dart';
import 'package:soft_dream_test/domain/repository/storage_repository.dart';
import 'package:soft_dream_test/domain/repository/store_repository.dart';
import 'package:soft_dream_test/domain/usecase/base/future/base_future_use_case.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_input.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_output.dart';

@Injectable()
class GetUserProfileUseCase extends BaseFutureUseCase<GetUserProfileInput, GetUserProfileOutput> {
  const GetUserProfileUseCase(this._storeRepository, this._storageRepository);
  final StoreRepository _storeRepository;
  final StorageRepository _storageRepository;

  @override
  Future<GetUserProfileOutput> buildUseCase(GetUserProfileInput input) async {
    final response = await _storeRepository.getUserProfile();
    await _storageRepository.saveCurrentUser(uid: response!.uid, fullName: response.fullName, email: response.email, avtUrl: response.avatarUrl);
    return GetUserProfileOutput(accountInfo: response);
  }
}

class GetUserProfileInput extends BaseInput {
  const GetUserProfileInput();
}

class GetUserProfileOutput extends BaseOutput {
  final AccountInfo? accountInfo;

  GetUserProfileOutput({required this.accountInfo});
}
