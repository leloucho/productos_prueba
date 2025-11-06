import '../entities/producto_entity.dart';
import '../repositories/producto_repository.dart';

class CreateProducto {
  final ProductoRepository repository;

  CreateProducto(this.repository);

  Future<void> call(ProductoEntity producto) async {
    return await repository.createProducto(producto);
  }
}