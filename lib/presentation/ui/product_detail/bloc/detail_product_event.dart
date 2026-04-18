import 'package:soft_dream_test/presentation/base/bloc/base_bloc_event.dart';

class DetailProductEvent extends BaseBlocEvent {
  const DetailProductEvent();
}

class DetailProductInitEvent extends DetailProductEvent {
  final String id;
  const DetailProductInitEvent(this.id);
}

class GetProductEvent extends DetailProductEvent {
  const GetProductEvent();
}

class RemoveProductEvent extends DetailProductEvent {
  const RemoveProductEvent();
}
