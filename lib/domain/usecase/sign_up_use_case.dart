import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/repository/auth_repository.dart';
import 'package:soft_dream_test/domain/repository/store_repository.dart';
import 'package:soft_dream_test/domain/usecase/base/future/base_future_use_case.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_input.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_output.dart';

@Injectable()
class SignUpUseCase extends BaseFutureUseCase<SignUpInput, SignUpOutput> {
  const SignUpUseCase(this._appRepository, this._storeRepository);
  final AuthRepository _appRepository;
  final StoreRepository _storeRepository;

  @override
  Future<SignUpOutput> buildUseCase(SignUpInput input) async {
    final response = await _appRepository.signUp(email: input.email, password: input.password, fullName: input.fullName);
    await _storeRepository.
    return SignUpOutput();
  }
}

class SignUpInput extends BaseInput {
  final String email;
  final String password;
  final String fullName;
  const SignUpInput({required this.email, required this.password, required this.fullName});
}

class SignUpOutput extends BaseOutput {}
