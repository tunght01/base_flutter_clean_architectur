import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:soft_dream_test/di/di.dart';
import 'package:soft_dream_test/presentation/app/bloc/app_bloc.dart';
import 'package:soft_dream_test/presentation/app/bloc/app_event.dart';
import 'package:soft_dream_test/presentation/common_view/button/app_button.dart';
import 'package:soft_dream_test/presentation/common_view/scaffold/common_scaffold.dart';
import 'package:soft_dream_test/presentation/common_view/spacing/spacing_const.dart';
import 'package:soft_dream_test/presentation/ui/account_info/bloc/account_info_bloc.dart';

import '../account_info/bloc/account_info_event.dart';

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
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CommonScaffold(
      body: Column(
        children: [
          kSpacingHeight24,
          AppButton(
            label: 'Dang xuat',
            onPressed: () {
              getIt.get<AccountInfoBloc>().add(PressedLogout());
            },
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
