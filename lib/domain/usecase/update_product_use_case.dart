import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/entities/product_entity.dart';
import 'package:soft_dream_test/domain/repository/product_repository.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_input.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_output.dart';

import 'base/future/base_future_use_case.dart';

@Injectable()
class UpdateProductUseCase
    extends BaseFutureUseCase<UpdateProductInput, UpdateProductOutput> {
  const UpdateProductUseCase(this._repository);

  final ProductRepository _repository;

  @override
  Future<UpdateProductOutput> buildUseCase(UpdateProductInput input) async {
    final response = await _repository.update(input.product);
    return UpdateProductOutput(response);
  }
}

class UpdateProductInput extends BaseInput {
  final ProductEntity product;
  const UpdateProductInput(this.product);
}

class UpdateProductOutput extends BaseOutput {
  final ProductEntity product;
  const UpdateProductOutput(this.product);
}
