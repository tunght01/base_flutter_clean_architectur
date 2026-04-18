import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_dream_test/di/di.dart';
import 'package:soft_dream_test/domain/navigation/app_navigator.dart';
import 'package:soft_dream_test/presentation/common_view/avatar/avatar_widget.dart';
import 'package:soft_dream_test/presentation/common_view/button/app_button.dart';
import 'package:soft_dream_test/presentation/common_view/scaffold/common_scaffold.dart';
import 'package:soft_dream_test/presentation/common_view/spacing/spacing_const.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/generated/l10n.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';
import 'package:soft_dream_test/presentation/ui/account_info/bloc/account_info_bloc.dart';
import 'package:soft_dream_test/presentation/ui/account_info/bloc/account_info_state.dart';

import 'bloc/account_info_event.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage>
    with AutomaticKeepAliveClientMixin {
  late final AccountInfoBloc bloc;
  late final AppNavigator navigator;

  @override
  void initState() {
    bloc = getIt.get();
    navigator = getIt.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CommonScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: Dimens.d12),
                child: BlocBuilder<AccountInfoBloc, AccountInfoState>(
                  bloc: bloc,
                  buildWhen: (previous, current) {
                    return previous.accountInfo != current.accountInfo;
                  },
                  builder: (_, state) {
                    return Row(
                      children: [
                        AvatarWidget(
                          avatarUrl: state.accountInfo?.avatarUrl,
                          size: 50,
                          radius: Dimens.d12,
                        ),
                        kSpacingWidth12,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                state.accountInfo?.fullName ?? '',
                                style: AppTextStyle.semiBold16(height: 24 / 16),
                              ),
                              Text(
                                state.accountInfo?.email ?? '',
                                style: AppTextStyle.medium10(height: 24 / 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              AppButton(
                label: S.current.sign_out,
                onPressed: () {
                  getIt.get<AccountInfoBloc>().add(PressedLogout());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
