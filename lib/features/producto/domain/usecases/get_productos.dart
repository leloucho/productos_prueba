import '../entities/producto_entity.dart';
import '../repositories/producto_repository.dart';

class GetProductos {
  final ProductoRepository repository;

  GetProductos(this.repository);

  Future<List<ProductoEntity>> call() async {
    return await repository.getProductos();
  }
}