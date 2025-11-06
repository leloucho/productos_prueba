import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/producto_model.dart';
import '../exceptions/server_exception.dart';

abstract class ProductoRemoteDataSource {
  Future<List<ProductoModel>> getProductos();
  Future<void> createProducto(ProductoModel producto);
  Future<void> updateProducto(ProductoModel producto);
  Future<void> deleteProducto(int id);
}

class ProductoRemoteDataSourceImpl implements ProductoRemoteDataSource {
  final http.Client client;
  static const String baseUrl = 'http://10.0.2.2:8080/api/productos';

  ProductoRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ProductoModel>> getProductos() async {
    try {
      final response = await client.get(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        return jsonList.map((json) => ProductoModel.fromJson(json)).toList();
      } else {
        throw ServerException(
          message: 'Error al obtener productos',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (e is ServerException) rethrow;
      throw ServerException(
        message: 'Error de conexión: ${e.toString()}',
      );
    }
  }

  @override
  Future<void> createProducto(ProductoModel producto) async {
    try {
      final response = await client.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(producto.toJson()),
      );

      if (response.statusCode != 201 && response.statusCode != 200) {
        throw ServerException(
          message: 'Error al crear producto',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (e is ServerException) rethrow;
      throw ServerException(
        message: 'Error de conexión: ${e.toString()}',
      );
    }
  }

  @override
  Future<void> updateProducto(ProductoModel producto) async {
    try {
      final response = await client.put(
        Uri.parse('$baseUrl/${producto.id}'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(producto.toJson()),
      );

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw ServerException(
          message: 'Error al actualizar producto',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (e is ServerException) rethrow;
      throw ServerException(
        message: 'Error de conexión: ${e.toString()}',
      );
    }
  }

  @override
  Future<void> deleteProducto(int id) async {
    try {
      final response = await client.delete(
        Uri.parse('$baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw ServerException(
          message: 'Error al eliminar producto',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      if (e is ServerException) rethrow;
      throw ServerException(
        message: 'Error de conexión: ${e.toString()}',
      );
    }
  }
}