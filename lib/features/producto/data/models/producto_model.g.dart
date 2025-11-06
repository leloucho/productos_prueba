// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductoModel _$ProductoModelFromJson(Map<String, dynamic> json) =>
    ProductoModel(
      id: (json['id'] as num?)?.toInt(),
      nombre: json['nombre'] as String,
      precio: (json['precio'] as num).toDouble(),
      stock: (json['stock'] as num).toInt(),
    );

Map<String, dynamic> _$ProductoModelToJson(ProductoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nombre': instance.nombre,
      'precio': instance.precio,
      'stock': instance.stock,
    };
