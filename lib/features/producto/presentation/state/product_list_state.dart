import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/producto_entity.dart';

part 'product_list_state.freezed.dart';

@freezed
class ProductListState with _$ProductListState {
  const factory ProductListState.initial() = _Initial;
  const factory ProductListState.loading() = _Loading;
  const factory ProductListState.loaded(List<ProductoEntity> productos) = _Loaded;
  const factory ProductListState.error(String message) = _Error;
}