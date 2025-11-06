import '../entities/producto_entity.dart';

abstract class ProductoRepository {
  Future<List<ProductoEntity>> getProductos();
  Future<void> createProducto(ProductoEntity producto);
  Future<void> updateProducto(ProductoEntity producto);
  Future<void> deleteProducto(int id);
}