import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:soft_dream_test/domain/navigation/app_navigator.dart';
import 'package:soft_dream_test/presentation/app/bloc/app_bloc.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc_event.dart';
import 'package:soft_dream_test/presentation/base/bloc/common/common_bloc.dart';
import 'package:soft_dream_test/presentation/base/bloc/common/common_event.dart';
import 'package:soft_dream_test/presentation/base/bloc/common/common_state.dart';
import 'package:soft_dream_test/presentation/common_view/snackbar/app_snackbar_content.dart';
import 'package:soft_dream_test/presentation/exception_handler/exception_handler.dart';
import 'package:soft_dream_test/presentation/exception_handler/exception_message_mapper.dart';
import 'package:soft_dream_test/presentation/resource/dimens/app_dimen.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';
import 'package:soft_dream_test/presentation/utils/snackbar_enum.dart';
import 'package:soft_dream_test/shared/exception/base/app_exception.dart';
import 'package:soft_dream_test/shared/exception/base/app_exception_wrapper.dart';
import 'package:soft_dream_test/shared/helper/stream/dispose_bag.dart';
import 'package:soft_dream_test/shared/mixin/log_mixin.dart';
import 'package:soft_dream_test/shared/utils/log_utils.dart';
import 'bloc/base_bloc.dart';

abstract class BasePageState<T extends StatefulWidget, B extends BaseBloc>
    extends BasePageStateDelegate<T, B> with LogMixin {}

abstract class BasePageStateDelegate<T extends StatefulWidget, B extends BaseBloc> extends State<T>
    with WidgetsBindingObserver
    implements ExceptionHandlerListener {
  late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();
  late final AppBloc appBloc = GetIt.instance.get<AppBloc>();
  late final ExceptionMessageMapper exceptionMessageMapper = const ExceptionMessageMapper();
  late final ExceptionHandler exceptionHandler = ExceptionHandler(
    navigator: navigator,
    listener: this,
  );
  bool isAppInBackground = false;

  dynamic get blocParam1 => null;
  dynamic get blocParam2 => null;

  // late final CommonBloc commonBloc = GetIt.instance.get<CommonBloc>()
  //   ..navigator = navigator
  //   ..disposeBag = disposeBag
  //   ..appBloc = appBloc
  //   ..exceptionHandler = exceptionHandler
  //   ..exceptionMessageMapper = exceptionMessageMapper;
  //
  // late final B bloc =
  //     GetIt.instance.get<B>(param1: blocParam1, param2: blocParam2)
  //       ..navigator = navigator
  //       ..disposeBag = disposeBag
  //       ..appBloc = appBloc
  //       ..commonBloc = commonBloc
  //       ..exceptionHandler = exceptionHandler
  //       ..onBlocEvent = onEvent
  //       ..exceptionMessageMapper = exceptionMessageMapper;

  late final CommonBloc commonBloc = GetIt.instance.get<CommonBloc>()
    ..setParamBloc(
        navigator: navigator,
        appBloc: appBloc,
        exceptionHandler: exceptionHandler,
        exceptionMessageMapper: exceptionMessageMapper,
        disposeBag: disposeBag);

  late final B bloc = GetIt.instance.get<B>(param1: blocParam1, param2: blocParam2)
    ..setParamBloc(
        navigator: navigator,
        appBloc: appBloc,
        exceptionHandler: exceptionHandler,
        exceptionMessageMapper: exceptionMessageMapper,
        disposeBag: disposeBag,
        commonBloc: commonBloc,
        onBlocEvent: onEvent);

  late final DisposeBag disposeBag = DisposeBag();

  bool get isAppWidget => false;

  void onEvent(BaseBlocEvent event) {}

  @override
  void didChangeDependencies() {
    if (!isAppWidget) {
      AppDimen.of(context);
      AppColors.of(context);
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused || state == AppLifecycleState.hidden) {
      onPauseApp();
      isAppInBackground = true;
    }

    if (state == AppLifecycleState.inactive) {
      onInactiveApp();
    }

    if (state == AppLifecycleState.resumed) {
      if (isAppInBackground) {
        onResumeApp();
      }
      isAppInBackground = false;
    }
  }

  void onResumeApp() {}

  void onPauseApp() {}

  void onInactiveApp() {}

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => navigator,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => bloc),
          BlocProvider(create: (_) => commonBloc),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<CommonBloc, CommonState>(
              listenWhen: (previous, current) =>
                  previous.appExceptionWrapper != current.appExceptionWrapper &&
                  current.appExceptionWrapper != null,
              listener: (context, state) {
                logger.i('appExceptionWrapper: ${state.appExceptionWrapper}');
                handleException(state.appExceptionWrapper!);
              },
            ),
            BlocListener<CommonBloc, CommonState>(
              listenWhen: (previous, current) =>
                  current.snackbarContents.isNotEmpty &&
                  previous.snackbarContents != current.snackbarContents,
              listener: (context, state) {
                final showSnackbar = state.snackbarContents.first;

                handleSnackBar(snackBarContent: showSnackbar, context: context);
              },
            ),
          ],
          child: buildPageListeners(
            child: isAppWidget
                ? buildPage(context)
                : Stack(
                    children: [
                      buildPage(context),
                      BlocBuilder<CommonBloc, CommonState>(
                        buildWhen: (previous, current) => previous.isLoading != current.isLoading,
                        builder: (context, state) => Visibility(
                          visible: state.isLoading,
                          child: buildPageLoading(),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget buildPageListeners({required Widget child}) => child;

  Widget buildPageLoading() => Container(
        color: Colors.black.withValues(alpha: 0.5),
        child: Center(
          child: CircularProgressIndicator(
            color: AppColors.current.primaryDefault,
          ),
        ),
      );

  Widget buildPage(BuildContext context);

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    disposeBag.dispose();
  }

  void handleException(AppExceptionWrapper appExceptionWrapper) {
    exceptionHandler
        .handleException(
      appExceptionWrapper,
      handleExceptionMessage(appExceptionWrapper.appException),
    )
        .then((value) {
      appExceptionWrapper.exceptionCompleter?.complete();
    });
  }

  void handleSnackBar({
    required AppSnackbarContent snackBarContent,
    required BuildContext context,
  }) {
    final snackBar = SnackBar(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (snackBarContent.titleWidget != null)
            snackBarContent.titleWidget!
          else if (snackBarContent.title != null)
            Text(
              snackBarContent.title!,
              style: snackBarContent.titleStyle ??
                  AppTextStyle.medium14(
                    color: AppColors.current.textTitle,
                  ),
            ),

          if (snackBarContent.messageWidget != null)
            snackBarContent.messageWidget!
          else if (snackBarContent.message != null ||
              snackBarContent.messageWidget == null)
            Text(
              snackBarContent.message ??
                  '',
              style: snackBarContent.messageStyle ??
                  AppTextStyle.medium14(
                    color: snackBarContent.title != null
                        ? AppColors.current.textBody
                        : AppColors.current.textTitle,
                  ),
            ),
        ],
      ),

      backgroundColor:
      snackBarContent.snackbarType.getBackGroundColor(context),

      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: snackBarContent.snackbarType.getBorderColor(context),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),

      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar)
          .closed
          .then((_) => commonBloc.add(const SnackbarShowOff()));
  }

  String handleExceptionMessage(AppException appException) {
    return exceptionMessageMapper.map(appException);
  }

  @override
  void onRefreshTokenFailed() {
    //TODO
  }
}

abstract class BasePageStateKeepAlive<T extends StatefulWidget, B extends BaseBloc>
    extends BasePageStateDelegateKeepAlive<T, B> with LogMixin {}

abstract class BasePageStateDelegateKeepAlive<T extends StatefulWidget, B extends BaseBloc>
    extends State<T> with AutomaticKeepAliveClientMixin implements ExceptionHandlerListener {
  late final AppNavigator navigator = GetIt.instance.get<AppNavigator>();
  late final AppBloc appBloc = GetIt.instance.get<AppBloc>();
  late final ExceptionMessageMapper exceptionMessageMapper = const ExceptionMessageMapper();
  late final ExceptionHandler exceptionHandler = ExceptionHandler(
    navigator: navigator,
    listener: this,
  );

  dynamic get blocParam1 => null;
  dynamic get blocParam2 => null;

  late final CommonBloc commonBloc = GetIt.instance.get<CommonBloc>()
    ..setParamBloc(
        navigator: navigator,
        appBloc: appBloc,
        exceptionHandler: exceptionHandler,
        exceptionMessageMapper: exceptionMessageMapper,
        disposeBag: disposeBag);

  late final B bloc = GetIt.instance.get<B>(param1: blocParam1, param2: blocParam2)
    ..setParamBloc(
        navigator: navigator,
        appBloc: appBloc,
        exceptionHandler: exceptionHandler,
        exceptionMessageMapper: exceptionMessageMapper,
        disposeBag: disposeBag,
        commonBloc: commonBloc,
        onBlocEvent: onEvent);

  late final DisposeBag disposeBag = DisposeBag();

  bool get isAppWidget => false;

  void onEvent(BaseBlocEvent event) {}

  @override
  void didChangeDependencies() {
    if (!isAppWidget) {
      AppDimen.of(context);
      AppColors.of(context);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Provider(
      create: (context) => navigator,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => bloc),
          BlocProvider(create: (_) => commonBloc),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<CommonBloc, CommonState>(
              listenWhen: (previous, current) =>
                  previous.appExceptionWrapper != current.appExceptionWrapper &&
                  current.appExceptionWrapper != null,
              listener: (context, state) {
                handleException(state.appExceptionWrapper!);
              },
            ),
            BlocListener<CommonBloc, CommonState>(
              listenWhen: (previous, current) =>
                  current.snackbarContents.isNotEmpty &&
                  previous.snackbarContents != current.snackbarContents,
              listener: (context, state) {
                final showSnackbar = state.snackbarContents.first;

                handleSnackBar(snackBarContent: showSnackbar, context: context);
              },
            ),
          ],
          child: buildPageListeners(
            child: isAppWidget
                ? buildPage(context)
                : Stack(
                    children: [
                      buildPage(context),
                      BlocBuilder<CommonBloc, CommonState>(
                        buildWhen: (previous, current) => previous.isLoading != current.isLoading,
                        builder: (context, state) => Visibility(
                          visible: state.isLoading,
                          child: buildPageLoading(),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget buildPageListeners({required Widget child}) => child;

  Widget buildPageLoading() => Container(
        color: Colors.black.withValues(alpha: 0.5),
        child: Center(
          child: CircularProgressIndicator(
            color: AppColors.current.primaryDefault,
          ),
        ),
      );

  Widget buildPage(BuildContext context);

  @override
  void dispose() {
    super.dispose();
    disposeBag.dispose();
  }

  void handleException(AppExceptionWrapper appExceptionWrapper) {
    exceptionHandler
        .handleException(
      appExceptionWrapper,
      handleExceptionMessage(appExceptionWrapper.appException),
    )
        .then((value) {
      appExceptionWrapper.exceptionCompleter?.complete();
    });
  }

  void handleSnackBar({
    required AppSnackbarContent snackBarContent,
    required BuildContext context,
  }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor:
      snackBarContent.snackbarType.getBackGroundColor(context),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: snackBarContent.snackbarType.getBorderColor(context),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...[
          snackBarContent.snackbarType.icon,
          const SizedBox(width: 8),
        ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (snackBarContent.titleWidget != null)
                  snackBarContent.titleWidget!
                else if (snackBarContent.title != null)
                  Text(
                    snackBarContent.title!,
                    style: snackBarContent.titleStyle ??
                        AppTextStyle.medium14(
                          color: AppColors.current.textTitle,
                        ),
                  ),
                if (snackBarContent.messageWidget != null)
                  snackBarContent.messageWidget!
                else
                  Text(
                    snackBarContent.message ??
                        '',
                    style: snackBarContent.messageStyle ??
                        AppTextStyle.medium14(
                          color: snackBarContent.title != null
                              ? AppColors.current.textBody
                              : AppColors.current.textTitle,
                        ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );

    ScaffoldMessenger.of(context)
        .showSnackBar(snackBar)
        .closed
        .then((_) => commonBloc.add(const SnackbarShowOff()));
  }

  String handleExceptionMessage(AppException appException) {
    return exceptionMessageMapper.map(appException);
  }

  @override
  void onRefreshTokenFailed() {
   //todo
  }

  @override
  bool get wantKeepAlive => true;
}
