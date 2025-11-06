import '../../domain/entities/producto_entity.dart';
import '../../domain/repositories/producto_repository.dart';
import '../datasources/producto_remote_datasource.dart';
import '../models/producto_model.dart';

class ProductoRepositoryImpl implements ProductoRepository {
  final ProductoRemoteDataSource remoteDataSource;

  ProductoRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ProductoEntity>> getProductos() async {
    final productos = await remoteDataSource.getProductos();
    return productos.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> createProducto(ProductoEntity producto) async {
    final model = ProductoModel.fromEntity(producto);
    await remoteDataSource.createProducto(model);
  }

  @override
  Future<void> updateProducto(ProductoEntity producto) async {
    final model = ProductoModel.fromEntity(producto);
    await remoteDataSource.updateProducto(model);
  }

  @override
  Future<void> deleteProducto(int id) async {
    await remoteDataSource.deleteProducto(id);
  }
}