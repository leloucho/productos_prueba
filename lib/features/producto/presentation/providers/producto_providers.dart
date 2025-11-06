import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import '../../data/datasources/producto_remote_datasource.dart';
import '../../data/repositories/producto_repository_impl.dart';
import '../../domain/repositories/producto_repository.dart';
import '../../domain/usecases/get_productos.dart';
import '../../domain/usecases/create_producto.dart';
import '../../domain/usecases/update_producto.dart';
import '../../domain/usecases/delete_producto.dart';
import '../notifiers/product_list_notifier.dart';
import '../state/product_list_state.dart';

// HTTP Client Provider
final httpClientProvider = Provider<http.Client>((ref) {
  return http.Client();
});

// Data Source Provider
final productoRemoteDataSourceProvider = Provider<ProductoRemoteDataSource>((ref) {
  final client = ref.watch(httpClientProvider);
  return ProductoRemoteDataSourceImpl(client: client);
});

// Repository Provider
final productoRepositoryProvider = Provider<ProductoRepository>((ref) {
  final dataSource = ref.watch(productoRemoteDataSourceProvider);
  return ProductoRepositoryImpl(remoteDataSource: dataSource);
});

// Use Cases Providers
final getProductosProvider = Provider<GetProductos>((ref) {
  final repository = ref.watch(productoRepositoryProvider);
  return GetProductos(repository);
});

final createProductoProvider = Provider<CreateProducto>((ref) {
  final repository = ref.watch(productoRepositoryProvider);
  return CreateProducto(repository);
});

final updateProductoProvider = Provider<UpdateProducto>((ref) {
  final repository = ref.watch(productoRepositoryProvider);
  return UpdateProducto(repository);
});

final deleteProductoProvider = Provider<DeleteProducto>((ref) {
  final repository = ref.watch(productoRepositoryProvider);
  return DeleteProducto(repository);
});

// Notifier Provider
final productListNotifierProvider = NotifierProvider<ProductListNotifier, ProductListState>(() {
  return ProductListNotifier(
    getProductos: GetProductos(ProductoRepositoryImpl(
      remoteDataSource: ProductoRemoteDataSourceImpl(client: http.Client()),
    )),
    createProducto: CreateProducto(ProductoRepositoryImpl(
      remoteDataSource: ProductoRemoteDataSourceImpl(client: http.Client()),
    )),
    updateProducto: UpdateProducto(ProductoRepositoryImpl(
      remoteDataSource: ProductoRemoteDataSourceImpl(client: http.Client()),
    )),
    deleteProducto: DeleteProducto(ProductoRepositoryImpl(
      remoteDataSource: ProductoRemoteDataSourceImpl(client: http.Client()),
    )),
  );
});