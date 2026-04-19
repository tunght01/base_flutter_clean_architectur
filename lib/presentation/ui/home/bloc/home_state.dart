import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:soft_dream_test/domain/entities/product_entity.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc_state.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState extends BaseBlocState with _$HomeState {
  const HomeState._();
  const factory HomeState({
    List<ProductEntity>? originalProduct,
    List<ProductEntity>? listProduct,
    @Default(false) bool isSelectedInStock,
    String? query,
  }) = _HomeState;
}
