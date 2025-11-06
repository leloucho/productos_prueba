class ProductoEntity {
  final int? id;
  final String nombre;
  final double precio;
  final int stock;

  const ProductoEntity({
    this.id,
    required this.nombre,
    required this.precio,
    required this.stock,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProductoEntity &&
        other.id == id &&
        other.nombre == nombre &&
        other.precio == precio &&
        other.stock == stock;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nombre.hashCode ^
        precio.hashCode ^
        stock.hashCode;
  }

  @override
  String toString() {
    return 'ProductoEntity(id: $id, nombre: $nombre, precio: $precio, stock: $stock)';
  }
}