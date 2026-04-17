import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/navigation/app_navigator.dart';
import 'package:soft_dream_test/domain/navigation/app_route_info.dart';
import 'package:soft_dream_test/domain/repository/auth_repository.dart';
import 'package:soft_dream_test/domain/repository/storage_repository.dart';
import 'package:soft_dream_test/domain/usecase/base/future/base_future_use_case.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_input.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_output.dart';

@Injectable()
class LogoutUseCase extends BaseFutureUseCase<LogoutInput, LogoutOutput> {
  const LogoutUseCase(this._repository, this._navigator, this._authRepository);

  final StorageRepository _repository;
  final AppNavigator _navigator;
  final AuthRepository _authRepository;

  @override
  Future<LogoutOutput> buildUseCase(LogoutInput input) async {
    if (_repository.isLoggedIn) {
      await _authRepository.logout();
      await _repository.clearCurrentUserData();
      _navigator.replaceAll([const AppRouteInfo.login()]);
    }

    return const LogoutOutput();
  }
}

class LogoutInput extends BaseInput {
  final bool logoutAll;
  const LogoutInput(this.logoutAll);
}

class LogoutOutput extends BaseOutput {
  const LogoutOutput();
}
