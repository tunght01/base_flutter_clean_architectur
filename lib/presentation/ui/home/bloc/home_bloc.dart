import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/di/di.dart';
import 'package:soft_dream_test/domain/navigation/app_route_info.dart';
import 'package:soft_dream_test/domain/usecase/create_product_use_case.dart';
import 'package:soft_dream_test/domain/usecase/get_all_product_use_case.dart';
import 'package:soft_dream_test/domain/usecase/seed_if_empty_product_use_case.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc.dart';
import 'package:soft_dream_test/presentation/ui/account_info/bloc/account_info_bloc.dart';

import 'bloc.dart';

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
    on<HomePageRefreshed>(_onHomePageRefreshed, transformer: log());
    on<FilterProductEvent>(_onFilterProductEvent, transformer: log());
    on<OnUpdateQueryEvent>(_onOnUpdateQueryEvent, transformer: debounceTime());
    on<OnSelectedInStockEvent>(
      _onOnSelectedInStockEvent,
      transformer: debounceTime(),
    );
  }

  final SeedIfEmptyProductUseCase _seedIfEmptyProductUseCase;
  final GetAllProductUseCase _allProductUseCase;
  final CreateProductUseCase _createProductUseCase;

  FutureOr<void> _onHomeInitEvent(
    HomeInitEvent event,
    Emitter<HomeState> emit,
  ) {
    return runBlocCatching(
      handleLoading: false,
      action: () async {
        /// Không có dữ liệu thì tạo seed data
        await _seedIfEmptyProductUseCase.execute(SeedIfEmptyProductInput());
        add(GetAllProductEvent());
      },
    );
  }

  /// lấy danh sách sản phẩm lưu trong db
  FutureOr<void> _onGetAllProductEvent(
    GetAllProductEvent event,
    Emitter<HomeState> emit,
  ) async {
    await _getProducts(emit: emit, handleLoading: true);
  }

  /// tạo sản phẩm mới
  FutureOr<void> _onCreateProductEvent(
    CreateProductEvent event,
    Emitter<HomeState> emit,
  ) {
    return runBlocCatching(
      action: () async {
        await _createProductUseCase.execute(
          CreateProductInput(product: event.productEntity),
        );

        /// call lấy lại sản phẩm sau khi tạo
        add(GetAllProductEvent());
      },
    );
  }

  FutureOr<void> _onOnPressProductEvent(
    OnPressProductEvent event,
    Emitter<HomeState> emit,
  ) async {
    final hasChanged = await navigator.push(
      AppRouteInfo.productDetail(id: event.id),
    );

    /// check nếu user có thao tác với sản phẩm thì sẽ call lấy lại sản phẩm
    if (hasChanged is bool && hasChanged ||
        getIt<AccountInfoBloc>().state.isEdit) {
      add(GetAllProductEvent());
    }
  }

  FutureOr<void> _onHomePageRefreshed(
    HomePageRefreshed event,
    Emitter<HomeState> emit,
  ) async {
    await _getProducts(
      emit: emit,
      handleLoading: false,
      doOnSuccessOrError: () async {
        if (!event.completer.isCompleted) {
          event.completer.complete();
        }
      },
    );
  }

  Future<void> _getProducts({
    required Emitter<HomeState> emit,
    required bool handleLoading,
    Future<void> Function()? doOnSuccessOrError,
  }) async {
    return runBlocCatching(
      handleLoading: handleLoading,
      action: () async {
        final inStock = state.isSelectedInStock;

        final output = await _allProductUseCase.execute(
          GetAllProductInput(state.query, inStock),
        );
        emit(state.copyWith(listProduct: output.products));
      },
      doOnSuccessOrError: doOnSuccessOrError,
      maxRetries: 3,
    );
  }

  FutureOr<void> _onFilterProductEvent(
    FilterProductEvent event,
    Emitter<HomeState> emit,
  ) async {
    await _getProducts(handleLoading: false, emit: emit);
  }

  void _onOnUpdateQueryEvent(
    OnUpdateQueryEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(query: event.query));
  }

  void _onOnSelectedInStockEvent(
    OnSelectedInStockEvent event,
    Emitter<HomeState> emit,
  ) {
    final inStock = state.isSelectedInStock;

    emit(state.copyWith(isSelectedInStock: !inStock));
  }
}
