import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:soft_dream_test/domain/entities/account_info.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc_state.dart';

part 'account_info_state.freezed.dart';

@freezed
abstract class AccountInfoState extends BaseBlocState with _$AccountInfoState {
  const AccountInfoState._();
  const factory AccountInfoState({
    AccountInfo? accountInfo,
    @Default(false) bool isEdit,
  }) = _AccountInfoState;
}
