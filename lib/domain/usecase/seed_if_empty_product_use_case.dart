import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/repository/product_repository.dart';
import 'package:soft_dream_test/domain/repository/storage_repository.dart';
import 'package:soft_dream_test/domain/repository/store_repository.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_input.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_output.dart';
import 'package:soft_dream_test/shared/utils/enums/app_enum.dart';

import 'base/future/base_future_use_case.dart';

@Injectable()
class SeedIfEmptyProductUseCase
    extends
        BaseFutureUseCase<SeedIfEmptyProductInput, SeedIfEmptyProductOutput> {
  const SeedIfEmptyProductUseCase(this._repository, this._storeRepository);

  final ProductRepository _repository;
  final StorageRepository _storeRepository;

  @override
  Future<SeedIfEmptyProductOutput> buildUseCase(
    SeedIfEmptyProductInput input,
  ) async {
    if (_storeRepository.isFirstLaunchApp) {
      await _repository.seedIfEmpty();
    }
    return SeedIfEmptyProductOutput();
  }
}

class SeedIfEmptyProductInput extends BaseInput {
  const SeedIfEmptyProductInput();
}

class SeedIfEmptyProductOutput extends BaseOutput {
  final List<InitialAppRoute> initialRoutes;

  const SeedIfEmptyProductOutput({
    this.initialRoutes = const [InitialAppRoute.login],
  });
}
