import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/repository/app_repository.dart';
import 'package:soft_dream_test/domain/usecase/base/future/base_future_use_case.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_input.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_output.dart';

@Injectable()
class SignUpUseCase extends BaseFutureUseCase<SignUpInput, SignUpOutput> {
  const SignUpUseCase(this._appRepository);
  final AppRepository _appRepository;
  
  @override
  Future<SignUpOutput> buildUseCase(SignUpInput input) async {
    await _appRepository.signUpWithEmailAndPassword(input.email, input.password);
    return SignUpOutput();
  }
}

class SignUpInput extends BaseInput {
  final String email;
  final String password;
  const SignUpInput({required this.email, required this.password});
}

class SignUpOutput extends BaseOutput {}
