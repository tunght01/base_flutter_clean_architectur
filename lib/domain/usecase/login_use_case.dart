import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_input.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_output.dart';
import 'package:soft_dream_test/domain/usecase/base/sync/base_sync_use_case.dart';

@Injectable()
class LoginUseCase extends BaseSyncUseCase<LoginInput, LoginOutput> {
  const LoginUseCase();

  @override
  LoginOutput buildUseCase(LoginInput input) {
    return LoginOutput();
  }
}

class LoginInput extends BaseInput {
  const LoginInput();
}

class LoginOutput extends BaseOutput {}
