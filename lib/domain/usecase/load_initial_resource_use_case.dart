import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_input.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_output.dart';
import 'package:soft_dream_test/domain/usecase/base/sync/base_sync_use_case.dart';

@Injectable()
class LoadInitialResourceUseCase
    extends
        BaseSyncUseCase<LoadInitialResourceInput, LoadInitialResourceOutput> {
  const LoadInitialResourceUseCase();

  @override
  LoadInitialResourceOutput buildUseCase(LoadInitialResourceInput input) {
    return LoadInitialResourceOutput();
  }
}

class LoadInitialResourceInput extends BaseInput {
  const LoadInitialResourceInput();
}

class LoadInitialResourceOutput extends BaseOutput {}
