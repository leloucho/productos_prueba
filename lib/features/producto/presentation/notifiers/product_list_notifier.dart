import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/producto_entity.dart';
import '../../domain/usecases/get_productos.dart';
import '../../domain/usecases/create_producto.dart';
import '../../domain/usecases/update_producto.dart';
import '../../domain/usecases/delete_producto.dart';
import '../state/product_list_state.dart';

class ProductListNotifier extends Notifier<ProductListState> {
  final GetProductos _getProductos;
  final CreateProducto _createProducto;
  final UpdateProducto _updateProducto;
  final DeleteProducto _deleteProducto;

  ProductListNotifier({
    required GetProductos getProductos,
    required CreateProducto createProducto,
    required UpdateProducto updateProducto,
    required DeleteProducto deleteProducto,
  })  : _getProductos = getProductos,
        _createProducto = createProducto,
        _updateProducto = updateProducto,
        _deleteProducto = deleteProducto;

  @override
  ProductListState build() {
    return const ProductListState.initial();
  }

  Future<void> loadProductos() async {
    state = const ProductListState.loading();
    try {
      final productos = await _getProductos();
      state = ProductListState.loaded(productos);
    } catch (e) {
      state = ProductListState.error('Error al cargar productos: ${e.toString()}');
    }
  }

  Future<void> createProducto(ProductoEntity producto) async {
    try {
      await _createProducto(producto);
      await loadProductos(); // Recargar la lista
    } catch (e) {
      state = ProductListState.error('Error al crear producto: ${e.toString()}');
    }
  }

  Future<void> updateProducto(ProductoEntity producto) async {
    try {
      await _updateProducto(producto);
      await loadProductos(); // Recargar la lista
    } catch (e) {
      state = ProductListState.error('Error al actualizar producto: ${e.toString()}');
    }
  }

  Future<void> deleteProducto(int id) async {
    try {
      await _deleteProducto(id);
      await loadProductos(); // Recargar la lista
    } catch (e) {
      state = ProductListState.error('Error al eliminar producto: ${e.toString()}');
    }
  }
}