import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:soft_dream_test/domain/entities/product_entity.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc_state.dart';

part 'detail_product_state.freezed.dart';

@freezed
abstract class DetailProductState extends BaseBlocState
    with _$DetailProductState {
  const DetailProductState._();
  const factory DetailProductState({
    ProductEntity? product,
    String? id,
    @Default(false) bool isEdit,
  }) = _DetailProductState;
}
