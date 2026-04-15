import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/base/overlay/user_cmd.dart';
export 'user_cmd.dart';
export 'base_dialog_state.dart';
export 'base_sheet_state.dart';

abstract class IOverlay {
  Future<void>? onResultBack([UserCmd? cmd]);
  Future<void>? onResultNext([UserCmd? cmd]);
  Widget? backWidget([UserCmd? cmd]);
  Widget? nextWidget([UserCmd? cmd]);
  IOverlay? back([UserCmd? cmd]);
  IOverlay? next([UserCmd? cmd]);
  Future<UserCmd?> show(BuildContext context, Widget? child);

  Future<UserCmd?> cmd(BuildContext context, UserCmd cmd);
  Future<UserCmd?> onTapOutside(BuildContext context);
}
