import '../repositories/producto_repository.dart';

class DeleteProducto {
  final ProductoRepository repository;

  DeleteProducto(this.repository);

  Future<void> call(int id) async {
    return await repository.deleteProducto(id);
  }
}