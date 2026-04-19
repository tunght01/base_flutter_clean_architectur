import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/repository/storage_repository.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_input.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_output.dart';

import 'base/future/base_future_use_case.dart';

@Injectable()
class SaveDarkModeUseCase
    extends BaseFutureUseCase<SaveDarkModeInput, SaveDarkModeOutput> {
  const SaveDarkModeUseCase(this._repository);

  final StorageRepository _repository;

  @override
  Future<SaveDarkModeOutput> buildUseCase(SaveDarkModeInput input) async {
    await _repository.saveDarkModeApp(input.isDarkMode);
    return SaveDarkModeOutput();
  }
}

class SaveDarkModeInput extends BaseInput {
  final bool isDarkMode;
  const SaveDarkModeInput({required this.isDarkMode});
}

class SaveDarkModeOutput extends BaseOutput {
  const SaveDarkModeOutput();
}
