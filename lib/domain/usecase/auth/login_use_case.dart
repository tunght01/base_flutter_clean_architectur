import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/repository/auth_repository.dart';
import 'package:soft_dream_test/domain/repository/storage_repository.dart';
import 'package:soft_dream_test/domain/usecase/base/future/base_future_use_case.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_input.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_output.dart';

@Injectable()
class LoginUseCase extends BaseFutureUseCase<LoginInput, LoginOutput> {
  const LoginUseCase(this._authRepository, this._storageRepository);
  final AuthRepository _authRepository;
  final StorageRepository _storageRepository;

  @override
  Future<LoginOutput> buildUseCase(LoginInput input) async {
    final response = await _authRepository.signInWithEmailAndPassword(
      input.email,
      input.password,
    );
    if (response.isNotEmpty) {
      await _storageRepository.saveCurrentUser(uid: response);
      await _storageRepository.savePassword(input.password);
    }
    return LoginOutput();
  }
}

class LoginInput extends BaseInput {
  final String email;
  final String password;
  const LoginInput({required this.email, required this.password});
}

class LoginOutput extends BaseOutput {}
