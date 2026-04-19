import 'dart:async';

import 'package:soft_dream_test/domain/entities/product_entity.dart';
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

class HomePageRefreshed extends HomeEvent {
  final Completer<void> completer;
  const HomePageRefreshed(this.completer);
}

class CreateProductEvent extends HomeEvent {
  final ProductEntity productEntity;
  const CreateProductEvent(this.productEntity);
}

class OnPressProductEvent extends HomeEvent {
  final String id;
  const OnPressProductEvent(this.id);
}
