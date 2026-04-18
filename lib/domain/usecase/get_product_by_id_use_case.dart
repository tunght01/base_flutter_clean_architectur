import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/entities/product_entity.dart';
import 'package:soft_dream_test/domain/repository/product_repository.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_input.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_output.dart';
import 'base/future/base_future_use_case.dart';

@Injectable()
class GetProductByIdUseCase
    extends BaseFutureUseCase<GetProductByIdInput, GetProductByIdOutput> {
  const GetProductByIdUseCase(this._repository);

  final ProductRepository _repository;

  @override
  Future<GetProductByIdOutput> buildUseCase(GetProductByIdInput input) async {
    final response = await _repository.getById(input.id);
    return GetProductByIdOutput(product: response);
  }
}

class GetProductByIdInput extends BaseInput {
  final String id;
  const GetProductByIdInput({required this.id});
}

class GetProductByIdOutput extends BaseOutput {
  final ProductEntity? product;

  const GetProductByIdOutput({required this.product});
}
