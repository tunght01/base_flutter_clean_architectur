import 'package:flutter/material.dart';
import 'package:soft_dream_test/presentation/common_view/navigator/bottom_nav_item.dart';
import 'package:soft_dream_test/presentation/resource/dimens/dimens.dart';
import 'package:soft_dream_test/shared/utils/enums/app_enum.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    super.key,
    required this.pageIndex,
    required this.onChanged,
  });

  final int pageIndex;
  final ValueChanged<int> onChanged;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      child: Container(

        padding: EdgeInsets.only(
          left: Dimens.d12,
          right: Dimens.d12,
          bottom: Dimens.d12 + MediaQuery.of(context).padding.bottom,
        ),
        height:
            kBottomNavigationBarHeight +
            MediaQuery.of(context).padding.bottom +
            20,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(23, 236, 223, 0.1),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(
            [BottomTab.home, BottomTab.notification, BottomTab.profile].length,
            (index) {
              return BottomNavItem(
                onTap: () {
                  onChanged(index);
                },
                item: [
                  BottomTab.home,
                  BottomTab.notification,
                  BottomTab.profile,
                ][index],
                isSelected: pageIndex == index,
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
