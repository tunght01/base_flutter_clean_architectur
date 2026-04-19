import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_dream_test/di/di.dart';
import 'package:soft_dream_test/presentation/app/bloc/app_bloc.dart';
import 'package:soft_dream_test/presentation/app/bloc/app_event.dart';
import 'package:soft_dream_test/presentation/app/bloc/app_state.dart';
import 'package:soft_dream_test/presentation/common_view/app_bar/base_app_bar.dart';
import 'package:soft_dream_test/presentation/common_view/scaffold/common_scaffold.dart';
import 'package:soft_dream_test/presentation/common_view/spacing/spacing_const.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';
import 'package:soft_dream_test/presentation/ui/interface_app/widget/language_section_widget.dart';
import 'package:soft_dream_test/presentation/ui/interface_app/widget/theme_section_widget.dart';

@RoutePage()
class InterfacePage extends StatefulWidget {
  const InterfacePage({super.key});

  @override
  State<InterfacePage> createState() => _InterfacePageState();
}

class _InterfacePageState extends State<InterfacePage> {
  late final AppBloc _appBloc;

  @override
  void initState() {
    _appBloc = getIt<AppBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: BaseAppBar(label: S.current.interface_app),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimens.d16,
            vertical: Dimens.d20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: Dimens.d4),
                child: Text(
                  S.of(context).interface_app,
                  style: AppTextStyle.semiBold12(
                    color: AppColors.current.textSubTitle,
                  ),
                ),
              ),
              kSpacingHeight8,
              BlocBuilder<AppBloc, AppState>(
                buildWhen: (pre, cur) =>
                    pre.languageCode != cur.languageCode ||
                    pre.isDarkTheme != cur.isDarkTheme,
                bloc: _appBloc,
                builder: (context, state) {
                  return ThemeSectionWidget(
                    isDarkMode: state.isDarkTheme,
                    onChanged: (value) {
                      _appBloc.add(AppThemeChanged(isDarkTheme: value));
                    },
                  );
                },
              ),
              kSpacingHeight24,
              Padding(
                padding: const EdgeInsets.only(left: Dimens.d4),
                child: Text(
                  S.current.language,
                  style: AppTextStyle.semiBold12(
                    color: AppColors.current.textSubTitle,
                  ),
                ),
              ),
              kSpacingHeight8,
              BlocBuilder<AppBloc, AppState>(
                buildWhen: (pre, cur) =>
                    pre.languageCode != cur.languageCode ||
                    pre.isDarkTheme != cur.isDarkTheme,
                bloc: _appBloc,
                builder: (context, state) {
                  return LanguageSectionWidget(
                    languageCode: state.languageCode,
                    onSelected: (value) {
                      _appBloc.add(AppLanguageChanged(languageCode: value));
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
