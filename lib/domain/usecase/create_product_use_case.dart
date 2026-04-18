import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/entities/product_entity.dart';
import 'package:soft_dream_test/domain/repository/product_repository.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_input.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_output.dart';

import 'base/future/base_future_use_case.dart';

@Injectable()
class CreateProductUseCase
    extends BaseFutureUseCase<CreateProductInput, CreateProductOutput> {
  const CreateProductUseCase(this._repository);

  final ProductRepository _repository;

  @override
  Future<CreateProductOutput> buildUseCase(CreateProductInput input) async {
    final response = await _repository.create(input.product);
    return CreateProductOutput(product: response);
  }
}

class CreateProductInput extends BaseInput {
  final ProductEntity product;
  const CreateProductInput({required this.product});
}

class CreateProductOutput extends BaseOutput {
  final ProductEntity product;

  const CreateProductOutput({required this.product});
}
