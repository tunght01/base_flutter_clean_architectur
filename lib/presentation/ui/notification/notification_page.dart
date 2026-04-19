import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/common_view/scaffold/common_scaffold.dart';
import 'package:soft_dream_test/presentation/common_view/widget/empty_widget.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.d16),
          child: Center(
            child: EmptyWidget(),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
