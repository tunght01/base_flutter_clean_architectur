import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/repository/storage_repository.dart';
import 'package:soft_dream_test/domain/usecase/base/future/base_future_use_case.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_input.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_output.dart';
import 'package:soft_dream_test/shared/utils/enums/app_enum.dart';

@Injectable()
class GetInitialAppDataUseCase
    extends BaseFutureUseCase<GetInitialAppDataInput, GetInitialAppDataOutput> {
  const GetInitialAppDataUseCase(this._storageRepository);

  final StorageRepository _storageRepository;

  @override
  Future<GetInitialAppDataOutput> buildUseCase(
    GetInitialAppDataInput input,
  ) async {
    if(_storageRepository.isFirstLaunchApp) {
      await _storageRepository.saveIsFirsLaunchApp(false);
    }

    return GetInitialAppDataOutput(
      isDarkMode: _storageRepository.isDarkMode,
      languageCode: _storageRepository.languageCode,
      isLoggedIn: _storageRepository.isLoggedIn,
    );
  }
}

class GetInitialAppDataInput extends BaseInput {
  const GetInitialAppDataInput();
}

class GetInitialAppDataOutput extends BaseOutput {
  final bool isLoggedIn;
  final bool isDarkMode;
  final LanguageCode languageCode;

  const GetInitialAppDataOutput({
    this.isLoggedIn = false,
    this.isDarkMode = true,
    this.languageCode = LanguageCode.vi,
  });
}
