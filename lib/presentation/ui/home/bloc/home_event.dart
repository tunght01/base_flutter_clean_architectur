import 'package:soft_dream_test/presentation/base/bloc/base_bloc_event.dart';

class HomeEvent extends BaseBlocEvent {
  const HomeEvent();
}

class HomeInitEvent extends HomeEvent {
  const HomeInitEvent();
}

class GetAllProductEvent extends HomeEvent {
  const GetAllProductEvent();
}

class CreateProductEvent extends HomeEvent {
  const CreateProductEvent();
}

class OnPressProductEvent extends HomeEvent {
  final String id;
  const OnPressProductEvent(this.id);
}
