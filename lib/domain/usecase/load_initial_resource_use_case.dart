import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/repository/storage_repository.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_input.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_output.dart';
import 'package:soft_dream_test/domain/usecase/base/sync/base_sync_use_case.dart';
import 'package:soft_dream_test/shared/utils/enums/app_enum.dart';

@Injectable()
class LoadInitialResourceUseCase
    extends
        BaseSyncUseCase<LoadInitialResourceInput, LoadInitialResourceOutput> {
  const LoadInitialResourceUseCase(this._repository);

  final StorageRepository _repository;

  @protected
  @override
  LoadInitialResourceOutput buildUseCase(LoadInitialResourceInput input) {
    final initialRoutes = [
      _repository.isLoggedIn ? InitialAppRoute.main : InitialAppRoute.login,
    ];

    return LoadInitialResourceOutput(initialRoutes: initialRoutes);
  }
}

class LoadInitialResourceInput extends BaseInput {
  const LoadInitialResourceInput();
}

class LoadInitialResourceOutput extends BaseOutput {
  final List<InitialAppRoute> initialRoutes;

  const LoadInitialResourceOutput({
    this.initialRoutes = const [InitialAppRoute.login],
  });
}
