import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/entities/request/create_user_request.dart';
import 'package:soft_dream_test/domain/repository/auth_repository.dart';
import 'package:soft_dream_test/domain/repository/store_repository.dart';
import 'package:soft_dream_test/domain/usecase/base/future/base_future_use_case.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_input.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_output.dart';

@Injectable()
class SaveUserProfileUseCase
    extends BaseFutureUseCase<SaveUserProfileInput, SaveUserProfileOutput> {
  const SaveUserProfileUseCase(this._storeRepository);
  final StoreRepository _storeRepository;

  @override
  Future<SaveUserProfileOutput> buildUseCase(SaveUserProfileInput input) async {
    await _storeRepository.saveUserProfile(input.createUserRequest);
    return SaveUserProfileOutput();
  }
}

class SaveUserProfileInput extends BaseInput {
  final CreateUserRequest createUserRequest;
  const SaveUserProfileInput({required this.createUserRequest});
}

class SaveUserProfileOutput extends BaseOutput {}
