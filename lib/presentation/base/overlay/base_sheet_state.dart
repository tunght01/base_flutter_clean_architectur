import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:soft_dream_test/domain/navigation/app_navigator.dart';
import 'package:soft_dream_test/presentation/app/bloc/app_bloc.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc_event.dart';
import 'package:soft_dream_test/presentation/base/bloc/common/common_bloc.dart';
import 'package:soft_dream_test/presentation/exception_handler/exception_handler.dart';
import 'package:soft_dream_test/presentation/exception_handler/exception_message_mapper.dart';
import 'package:soft_dream_test/shared/helper/stream/dispose_bag.dart';
import 'package:soft_dream_test/shared/mixin/log_mixin.dart';
import 'overlay.dart';

abstract class BaseSheetState<T extends StatefulWidget>
    extends BaseSheetStateDelegate<T> with LogMixin {}

abstract class BaseSheetStateDelegate<T extends StatefulWidget> extends State<T>
    implements ExceptionHandlerListener {
  late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();
  late final AppBloc appBloc = GetIt.instance.get<AppBloc>();
  late final ExceptionMessageMapper exceptionMessageMapper =
      const ExceptionMessageMapper();
  late final ExceptionHandler exceptionHandler = ExceptionHandler(
    navigator: navigator,
    listener: this,
  );

  late final CommonBloc commonBloc = GetIt.instance.get<CommonBloc>()
    ..setParamBloc(
        navigator: navigator,
        appBloc: appBloc,
        exceptionHandler: exceptionHandler,
        exceptionMessageMapper: exceptionMessageMapper,
        disposeBag: disposeBag);

  late final DisposeBag disposeBag = DisposeBag();

  void onEvent(BaseBlocEvent event) {}

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if(buildSheetHeader(context) != null)
                buildSheetHeader(context)!,
                wrap
                    ? Wrap(
                        children: [buildContent(context)],
                      )
                    : buildContent(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool get wrap => true;

  Widget? buildSheetHeader(BuildContext context);
  Widget buildContent(BuildContext context);
  @override
  void onRefreshTokenFailed() {
    //todo
  }
}

abstract class ISheet implements IOverlay {
  @override
  Future<UserCmd?> show(BuildContext ctx, Widget? child, {bool wrap = true}) {
    if (child == null) {
      return Future(
        () => null,
      );
    }
    Widget content = wrap
        ? Wrap(
            children: [child],
          )
        : SizedBox(
            height:
                MediaQuery.of(ctx).size.height - MediaQuery.of(ctx).padding.top,
            child: child);
    return showModalBottomSheet<UserCmd>(
      context: ctx,
      isScrollControlled: true,
      // useSafeArea: true,
      // enableDrag: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: content,
          ),
        );
      },
    ).then((result) {
      if (result == null) {
        try {
          return onTapOutside(ctx);
        } catch (e) {
          return Future.value(null);
        }
      }
      return cmd(ctx, result);
    });
  }

  @override
  Future<UserCmd?> cmd(BuildContext context, UserCmd cmd) {
    if (cmd is BackCmd) {
      return onResultBack.call(cmd)?.then(
              (_) => back.call(cmd)?.show(context, backWidget.call(cmd))) ??
          back.call(cmd)?.show(context, backWidget.call(cmd)) ??
          Future(
            () => cmd,
          );
    } else {
      return onResultNext.call(cmd)?.then(
              (_) => next.call(cmd)?.show(context, nextWidget.call(cmd))) ??
          next.call(cmd)?.show(context, nextWidget.call(cmd)) ??
          Future(
            () => cmd,
          );
    }
  }

  @override
  Future<UserCmd?> onTapOutside(BuildContext context) {
    throw Exception();
  }
}
