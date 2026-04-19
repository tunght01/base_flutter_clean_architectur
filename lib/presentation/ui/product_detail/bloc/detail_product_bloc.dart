import 'dart:async';

import 'package:bloc/src/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/di/di.dart';
import 'package:soft_dream_test/domain/usecase/delete_product_use_case.dart';
import 'package:soft_dream_test/domain/usecase/get_product_by_id_use_case.dart';
import 'package:soft_dream_test/domain/usecase/update_product_use_case.dart';
import 'package:soft_dream_test/presentation/base/bloc/base_bloc.dart';
import 'package:soft_dream_test/presentation/ui/account_info/bloc/account_info_bloc.dart';
import 'package:soft_dream_test/presentation/ui/account_info/bloc/account_info_event.dart';
import 'package:soft_dream_test/presentation/ui/product_detail/bloc/detail_product_event.dart';
import 'package:soft_dream_test/presentation/ui/product_detail/bloc/detail_product_state.dart';

@Injectable()
class DetailProductBloc
    extends BaseBloc<DetailProductEvent, DetailProductState> {
  final UpdateProductUseCase _updateProductUseCase;
  final DeleteProductUseCase _deleteProductUseCase;
  final GetProductByIdUseCase _getProductByIdUseCase;

  DetailProductBloc(
    this._deleteProductUseCase,
    this._updateProductUseCase,
    this._getProductByIdUseCase,
  ) : super(const DetailProductState()) {
    on<DetailProductInitEvent>(_onDetailProductInitEvent, transformer: log());
    on<GetProductEvent>(_onGetProductEvent, transformer: log());
    on<RemoveProductEvent>(_onRemoveProductEvent, transformer: log());
    on<UpdateProductEvent>(_onUpdateProductEvent, transformer: log());
  }

  /// hàm init emit state để call ly thông tin sản phẩm
  FutureOr<void> _onDetailProductInitEvent(
    DetailProductInitEvent event,
    Emitter<DetailProductState> emit,
  ) {
    emit(state.copyWith(id: event.id));
  }

  /// lấy thông tin sản phẩm theo id
  FutureOr<void> _onGetProductEvent(
    GetProductEvent event,
    Emitter<DetailProductState> emit,
  ) {
    return runBlocCatching(
      handleError: true,
      action: () async {
        final response = await _getProductByIdUseCase.execute(
          GetProductByIdInput(id: state.id ?? ''),
        );

        emit(state.copyWith(product: response.product));
      },
    );
  }

  /// xóa sản phẩm theo id
  FutureOr<void> _onRemoveProductEvent(
    RemoveProductEvent event,
    Emitter<DetailProductState> emit,
  ) {
    return runBlocCatching(
      handleError: true,
      action: () async {
        await _deleteProductUseCase.execute(
          DeleteProductInput(id: state.id ?? ''),
        );
        getIt<AccountInfoBloc>().add(UserEditProductEvent(true));

        navigator.pop(result: true);
      },
    );
  }

  FutureOr<void> _onUpdateProductEvent(
    UpdateProductEvent event,
    Emitter<DetailProductState> emit,
  ) {
    return runBlocCatching(
      handleError: true,
      action: () async {
        /// cập nhật sản phm
        await _updateProductUseCase.execute(
          UpdateProductInput(event.productEntity),
        );

        /// láy lại thông tin sản phm sau khi sua
        add(const GetProductEvent());

        /// update de ben man sanh sach san pham biet call lai api de lay thon tin san pham moi nhat
        getIt<AccountInfoBloc>().add(UserEditProductEvent(true));
      },
    );
  }
}
