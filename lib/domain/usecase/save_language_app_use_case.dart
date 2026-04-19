import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/repository/storage_repository.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_input.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_output.dart';

import 'base/future/base_future_use_case.dart';

@Injectable()
class SaveLanguageAppUseCase
    extends BaseFutureUseCase<SaveLanguageAppInput, SaveLanguageAppOutput> {
  const SaveLanguageAppUseCase(this._repository);

  final StorageRepository _repository;

  @override
  Future<SaveLanguageAppOutput> buildUseCase(SaveLanguageAppInput input) async {
    await _repository.saveLanguageApp(input.languageApp);
    return SaveLanguageAppOutput();
  }
}

class SaveLanguageAppInput extends BaseInput {
  final String languageApp;
  const SaveLanguageAppInput({required this.languageApp});
}

class SaveLanguageAppOutput extends BaseOutput {
  const SaveLanguageAppOutput();
}
