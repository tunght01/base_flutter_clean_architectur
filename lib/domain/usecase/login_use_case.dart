import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/repository/app_repository.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_input.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_output.dart';
import 'package:soft_dream_test/domain/usecase/base/sync/base_sync_use_case.dart';

@Injectable()
class LoginUseCase extends BaseSyncUseCase<LoginInput, LoginOutput> {
  const LoginUseCase(this._appRepository);
  final AppRepository _appRepository;
  @override
  LoginOutput buildUseCase(LoginInput input) {
    final response = _appRepository.signInWithEmailAndPassword(input.email, input.password);
    return LoginOutput();
  }
}

class LoginInput extends BaseInput {
  final String email;
  final String password;
  const LoginInput({required this.email, required this.password});
}

class LoginOutput extends BaseOutput {}
