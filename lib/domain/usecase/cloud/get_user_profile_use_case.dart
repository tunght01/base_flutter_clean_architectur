import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/repository/storage_repository.dart';
import 'package:soft_dream_test/domain/repository/store_repository.dart';
import 'package:soft_dream_test/domain/usecase/base/future/base_future_use_case.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_input.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_output.dart';

@Injectable()
class GetUserProfileUseCase
    extends BaseFutureUseCase<GetUserProfileInput, GetUserProfileOutput> {
  const GetUserProfileUseCase(this._storeRepository, this._storageRepository);
  final StoreRepository _storeRepository;
  final StorageRepository _storageRepository;

  @override
  Future<GetUserProfileOutput> buildUseCase(GetUserProfileInput input) async {
    final response = await _storeRepository.getUserProfile();
    await _storageRepository.saveCurrentUser(
      uid: response!.uid,
      fullName: response.fullName,
      email: response.email,
      avtUrl: response.avatarUrl,
    );
    return GetUserProfileOutput();
  }
}

class GetUserProfileInput extends BaseInput {
  final String uid;
  const GetUserProfileInput({required this.uid});
}

class GetUserProfileOutput extends BaseOutput {}
