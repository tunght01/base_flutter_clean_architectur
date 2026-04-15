import 'package:flutter/material.dart';
import 'package:soft_dream_test/domain/navigation/app_navigator.dart';
import 'package:soft_dream_test/presentation/app/bloc/app_bloc.dart';
import 'package:soft_dream_test/presentation/base/bloc/common/common_bloc.dart';
import 'package:soft_dream_test/presentation/exception_handler/exception_handler.dart';
import 'package:soft_dream_test/presentation/exception_handler/exception_message_mapper.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/utils/responsive.dart';
import 'package:soft_dream_test/shared/helper/stream/dispose_bag.dart';
import 'package:soft_dream_test/shared/mixin/log_mixin.dart';

import 'overlay.dart';
import 'package:get_it/get_it.dart';

abstract class BaseDialogState<T extends StatefulWidget>
    extends BaseDialogStateDelegate<T> with LogMixin {}

abstract class BaseDialogStateDelegate<T extends StatefulWidget>
    extends State<T> implements ExceptionHandlerListener {
  late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();
  late final AppBloc appBloc = GetIt.instance.get<AppBloc>();
  late final ExceptionMessageMapper exceptionMessageMapper =
      const ExceptionMessageMapper();
  late final ExceptionHandler exceptionHandler = ExceptionHandler(
    navigator: navigator,
    listener: this,
  );

  dynamic get blocParam1 => null;
  dynamic get blocParam2 => null;

  late final CommonBloc commonBloc = GetIt.instance.get<CommonBloc>()
    ..navigator = navigator
    ..disposeBag = disposeBag
    ..appBloc = appBloc
    ..exceptionHandler = exceptionHandler
    ..exceptionMessageMapper = exceptionMessageMapper;

  late final DisposeBag disposeBag = DisposeBag();

  @override
  Widget build(BuildContext context) {
    late final double maxWidth;
    if (Responsive.isMobile(context)) {
      maxWidth = MediaQuery.of(context).size.width - 32;
    } else {
      maxWidth = 600 - 32;
    }
    return Align(
      alignment: Alignment.center,
      child: Material(
        color: AppColors.of(context).surfacePrimary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: AppColors.of(context).border)),
        child: Container(
          constraints: BoxConstraints(
            maxWidth: maxWidth,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [buildDialogHeader(context), buildContent(context)],
          ),
        ),
      ),
    );
  }

  Widget buildDialogHeader(BuildContext context);
  Widget buildContent(BuildContext context);
  @override
  void onRefreshTokenFailed() {
    //TODO
  }
}

abstract class IDialog implements IOverlay {
  const IDialog({this.barrierDismissible = true});
  final bool barrierDismissible;

  @override
  Future<UserCmd?> show(BuildContext context, Widget? child) async {
    if (child == null) {
      return null;
    }
    return showDialog<UserCmd>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: child,
        );
      },
    ).then((result) {
      if (result == null) {
        try {
          return onTapOutside(context);
        } catch (e) {
          return Future.value(null);
        }
      }
      return cmd(context, result);
    });
  }

  @override
  Future<UserCmd?> cmd(BuildContext context, UserCmd userCmd) {
    if (userCmd is BackCmd) {
      return onResultBack.call(userCmd)?.then((_) =>
              back.call(userCmd)?.show(context, backWidget.call(userCmd))) ??
          back.call(userCmd)?.show(context, backWidget.call(userCmd)) ??
          Future.value(null);
    } else {
      return onResultNext.call(userCmd)?.then((_) =>
              next.call(userCmd)?.show(context, nextWidget.call(userCmd))) ??
          next.call(userCmd)?.show(context, nextWidget.call(userCmd)) ??
          Future.value(null);
    }
  }

  @override
  Future<UserCmd?> onTapOutside(BuildContext context) {
    throw Exception();
  }
}
