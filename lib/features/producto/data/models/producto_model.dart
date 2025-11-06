import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/producto_entity.dart';

part 'producto_model.g.dart';

@JsonSerializable()
class ProductoModel {
  final int? id;
  final String nombre;
  final double precio;
  final int stock;

  const ProductoModel({
    this.id,
    required this.nombre,
    required this.precio,
    required this.stock,
  });

  factory ProductoModel.fromJson(Map<String, dynamic> json) =>
      _$ProductoModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductoModelToJson(this);

  factory ProductoModel.fromEntity(ProductoEntity entity) {
    return ProductoModel(
      id: entity.id,
      nombre: entity.nombre,
      precio: entity.precio,
      stock: entity.stock,
    );
  }

  ProductoEntity toEntity() {
    return ProductoEntity(
      id: id,
      nombre: nombre,
      precio: precio,
      stock: stock,
    );
  }
}