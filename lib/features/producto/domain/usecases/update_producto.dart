import '../entities/producto_entity.dart';
import '../repositories/producto_repository.dart';

class UpdateProducto {
  final ProductoRepository repository;

  UpdateProducto(this.repository);

  Future<void> call(ProductoEntity producto) async {
    return await repository.updateProducto(producto);
  }
}