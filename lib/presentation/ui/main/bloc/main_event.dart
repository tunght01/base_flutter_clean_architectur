import 'package:soft_dream_test/presentation/base/bloc/base_bloc_event.dart';

abstract class MainEvent extends BaseBlocEvent {
  const MainEvent();
}

class MainPageInitiated extends MainEvent {
  final int index;
  const MainPageInitiated({required this.index});
}
