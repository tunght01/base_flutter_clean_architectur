import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc_state.dart';
import 'package:soft_dream_test/presentation/common_view/snackbar/app_snackbar_content.dart';
import 'package:soft_dream_test/shared/exception/base/app_exception_wrapper.dart';
part 'common_state.freezed.dart';

@freezed
abstract class CommonState extends BaseBlocState with _$CommonState {
  const CommonState._();
  const factory CommonState({
    AppExceptionWrapper? appExceptionWrapper,
    @Default(0) int loadingCount,
    @Default(false) bool isLoading,
    @Default([]) List<AppSnackbarContent> snackbarContents,
  }) = _CommonState;
}
