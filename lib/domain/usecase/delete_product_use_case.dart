import 'package:injectable/injectable.dart';
import 'package:soft_dream_test/domain/entities/product_entity.dart';
import 'package:soft_dream_test/domain/repository/product_repository.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_input.dart';
import 'package:soft_dream_test/domain/usecase/base/io/base_output.dart';

import 'base/future/base_future_use_case.dart';

@Injectable()
class DeleteProductUseCase
    extends BaseFutureUseCase<DeleteProductInput, DeleteProductOutput> {
  const DeleteProductUseCase(this._repository);

  final ProductRepository _repository;

  @override
  Future<DeleteProductOutput> buildUseCase(DeleteProductInput input) async {
    await _repository.delete(input.id);
    return DeleteProductOutput();
  }
}

class DeleteProductInput extends BaseInput {
  final String id;
  const DeleteProductInput({required this.id});
}

class DeleteProductOutput extends BaseOutput {
  const DeleteProductOutput();
}
