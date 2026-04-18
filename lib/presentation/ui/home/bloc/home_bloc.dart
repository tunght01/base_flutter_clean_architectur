import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/entities/product_entity.dart';
import 'package:soft_dream_test/domain/navigation/app_route_info.dart';
import 'package:soft_dream_test/domain/usecase/create_product_use_case.dart';
import 'package:soft_dream_test/domain/usecase/get_all_product_use_case.dart';
import 'package:soft_dream_test/domain/usecase/seed_if_empty_product_use_case.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc.dart';
import 'package:soft_dream_test/presentation/ui/home/bloc/home_event.dart';
import 'package:soft_dream_test/presentation/ui/home/bloc/home_state.dart';

@Injectable()
class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc(
    this._seedIfEmptyProductUseCase,
    this._allProductUseCase,
    this._createProductUseCase,
  ) : super(const HomeState()) {
    on<HomeInitEvent>(_onHomeInitEvent, transformer: log());
    on<GetAllProductEvent>(_onGetAllProductEvent, transformer: log());
    on<CreateProductEvent>(_onCreateProductEvent, transformer: log());
    on<OnPressProductEvent>(_onOnPressProductEvent, transformer: log());
  }

  final SeedIfEmptyProductUseCase _seedIfEmptyProductUseCase;
  final GetAllProductUseCase _allProductUseCase;
  final CreateProductUseCase _createProductUseCase;

  FutureOr<void> _onHomeInitEvent(
    HomeInitEvent event,
    Emitter<HomeState> emit,
  ) {
    return runBlocCatching(
      action: () async {
        await _seedIfEmptyProductUseCase.execute(SeedIfEmptyProductInput());
        add(GetAllProductEvent());
      },
    );
  }

  FutureOr<void> _onGetAllProductEvent(
    GetAllProductEvent event,
    Emitter<HomeState> emit,
  ) async {
    final output = await _allProductUseCase.execute(GetAllProductInput());
    emit(state.copyWith(listProduct: output.products));
  }

  FutureOr<void> _onCreateProductEvent(
    CreateProductEvent event,
    Emitter<HomeState> emit,
  ) {
    return runBlocCatching(
      action: () async {
        await _seedIfEmptyProductUseCase.execute(SeedIfEmptyProductInput());
        final output = await _createProductUseCase.execute(
          CreateProductInput(product: ProductEntity()),
        );

        final products = List<ProductEntity>.from(state.listProduct ?? []);
        products.add(output.product);
        emit(state.copyWith(listProduct: products));
      },
    );
  }

  FutureOr<void> _onOnPressProductEvent(
    OnPressProductEvent event,
    Emitter<HomeState> emit,
  ) async {
    final isRemove = await navigator.push(
      AppRouteInfo.productDetail(id: event.id),
    );
    if (isRemove is bool && isRemove) {
      add(GetAllProductEvent());
    }
  }
}
