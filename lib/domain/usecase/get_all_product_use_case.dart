import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/entities/product_entity.dart';
import 'package:soft_dream_test/domain/repository/product_repository.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_input.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_output.dart';

import 'base/future/base_future_use_case.dart';

@Injectable()
class GetAllProductUseCase
    extends BaseFutureUseCase<GetAllProductInput, GetAllProductOutput> {
  const GetAllProductUseCase(this._repository);

  final ProductRepository _repository;

  @override
  Future<GetAllProductOutput> buildUseCase(GetAllProductInput input) async {
    final response = await _repository.getAll(
      inStockOnly: input.inStockOnly,
      query: input.query,
    );
    return GetAllProductOutput(products: response);
  }
}

class GetAllProductInput extends BaseInput {
  final String? query;
  final bool? inStockOnly;
  const GetAllProductInput(this.query, this.inStockOnly);
}

class GetAllProductOutput extends BaseOutput {
  final List<ProductEntity> products;

  const GetAllProductOutput({required this.products});
}
