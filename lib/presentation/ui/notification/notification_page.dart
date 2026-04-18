import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/common_view/scaffold/common_scaffold.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_colors.dart';
import 'package:soft_dream_test/presentation/resource/styles/app_text_styles.dart';

@RoutePage()
class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NotificationPageState();
  }
}

class _NotificationPageState extends State<NotificationPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CommonScaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.d16),

        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'ĐÂY LÀ MÀN HÌNH THÔNG BÁO',
                  style: AppTextStyle.bold16(
                    color: AppColors.current.primaryDefault,
                  ),
                ),
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
