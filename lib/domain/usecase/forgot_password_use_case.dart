import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/repository/app_repository.dart';
import 'package:soft_dream_test/domain/usecase/base/future/base_future_use_case.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_input.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_output.dart';

@Injectable()
class ForgotPasswordUseCase
    extends BaseFutureUseCase<ForgotPasswordInput, ForgotPasswordOutput> {
  final AppRepository _appRepository;

  ForgotPasswordUseCase(this._appRepository);

  @override
  Future<ForgotPasswordOutput> buildUseCase(ForgotPasswordInput input) async {
    await _appRepository.sendPasswordResetEmail(input.email);
    return ForgotPasswordOutput();
  }
}

class ForgotPasswordInput extends BaseInput {
  final String email;
  const ForgotPasswordInput({required this.email});
}

class ForgotPasswordOutput extends BaseOutput {}
