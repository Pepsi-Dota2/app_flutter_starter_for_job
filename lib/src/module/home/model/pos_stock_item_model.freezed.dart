// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_stock_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PosStockItemModel _$PosStockItemModelFromJson(Map<String, dynamic> json) {
  return _PosStockItemModel.fromJson(json);
}

/// @nodoc
mixin _$PosStockItemModel {
  String get average_cost => throw _privateConstructorUsedError;
  int get balance_qty => throw _privateConstructorUsedError;
  String get name_1 => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get unit_code => throw _privateConstructorUsedError;
  String get sale_price1 => throw _privateConstructorUsedError;
  String get url_image => throw _privateConstructorUsedError;

  /// Serializes this PosStockItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PosStockItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PosStockItemModelCopyWith<PosStockItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PosStockItemModelCopyWith<$Res> {
  factory $PosStockItemModelCopyWith(
          PosStockItemModel value, $Res Function(PosStockItemModel) then) =
      _$PosStockItemModelCopyWithImpl<$Res, PosStockItemModel>;
  @useResult
  $Res call(
      {String average_cost,
      int balance_qty,
      String name_1,
      String code,
      String unit_code,
      String sale_price1,
      String url_image});
}

/// @nodoc
class _$PosStockItemModelCopyWithImpl<$Res, $Val extends PosStockItemModel>
    implements $PosStockItemModelCopyWith<$Res> {
  _$PosStockItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PosStockItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? average_cost = null,
    Object? balance_qty = null,
    Object? name_1 = null,
    Object? code = null,
    Object? unit_code = null,
    Object? sale_price1 = null,
    Object? url_image = null,
  }) {
    return _then(_value.copyWith(
      average_cost: null == average_cost
          ? _value.average_cost
          : average_cost // ignore: cast_nullable_to_non_nullable
              as String,
      balance_qty: null == balance_qty
          ? _value.balance_qty
          : balance_qty // ignore: cast_nullable_to_non_nullable
              as int,
      name_1: null == name_1
          ? _value.name_1
          : name_1 // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      unit_code: null == unit_code
          ? _value.unit_code
          : unit_code // ignore: cast_nullable_to_non_nullable
              as String,
      sale_price1: null == sale_price1
          ? _value.sale_price1
          : sale_price1 // ignore: cast_nullable_to_non_nullable
              as String,
      url_image: null == url_image
          ? _value.url_image
          : url_image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PosStockItemModelImplCopyWith<$Res>
    implements $PosStockItemModelCopyWith<$Res> {
  factory _$$PosStockItemModelImplCopyWith(_$PosStockItemModelImpl value,
          $Res Function(_$PosStockItemModelImpl) then) =
      __$$PosStockItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String average_cost,
      int balance_qty,
      String name_1,
      String code,
      String unit_code,
      String sale_price1,
      String url_image});
}

/// @nodoc
class __$$PosStockItemModelImplCopyWithImpl<$Res>
    extends _$PosStockItemModelCopyWithImpl<$Res, _$PosStockItemModelImpl>
    implements _$$PosStockItemModelImplCopyWith<$Res> {
  __$$PosStockItemModelImplCopyWithImpl(_$PosStockItemModelImpl _value,
      $Res Function(_$PosStockItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PosStockItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? average_cost = null,
    Object? balance_qty = null,
    Object? name_1 = null,
    Object? code = null,
    Object? unit_code = null,
    Object? sale_price1 = null,
    Object? url_image = null,
  }) {
    return _then(_$PosStockItemModelImpl(
      average_cost: null == average_cost
          ? _value.average_cost
          : average_cost // ignore: cast_nullable_to_non_nullable
              as String,
      balance_qty: null == balance_qty
          ? _value.balance_qty
          : balance_qty // ignore: cast_nullable_to_non_nullable
              as int,
      name_1: null == name_1
          ? _value.name_1
          : name_1 // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      unit_code: null == unit_code
          ? _value.unit_code
          : unit_code // ignore: cast_nullable_to_non_nullable
              as String,
      sale_price1: null == sale_price1
          ? _value.sale_price1
          : sale_price1 // ignore: cast_nullable_to_non_nullable
              as String,
      url_image: null == url_image
          ? _value.url_image
          : url_image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PosStockItemModelImpl implements _PosStockItemModel {
  const _$PosStockItemModelImpl(
      {this.average_cost = "",
      this.balance_qty = 0,
      this.name_1 = "",
      this.code = "",
      this.unit_code = "",
      this.sale_price1 = "",
      this.url_image = ""});

  factory _$PosStockItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PosStockItemModelImplFromJson(json);

  @override
  @JsonKey()
  final String average_cost;
  @override
  @JsonKey()
  final int balance_qty;
  @override
  @JsonKey()
  final String name_1;
  @override
  @JsonKey()
  final String code;
  @override
  @JsonKey()
  final String unit_code;
  @override
  @JsonKey()
  final String sale_price1;
  @override
  @JsonKey()
  final String url_image;

  @override
  String toString() {
    return 'PosStockItemModel(average_cost: $average_cost, balance_qty: $balance_qty, name_1: $name_1, code: $code, unit_code: $unit_code, sale_price1: $sale_price1, url_image: $url_image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PosStockItemModelImpl &&
            (identical(other.average_cost, average_cost) ||
                other.average_cost == average_cost) &&
            (identical(other.balance_qty, balance_qty) ||
                other.balance_qty == balance_qty) &&
            (identical(other.name_1, name_1) || other.name_1 == name_1) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.unit_code, unit_code) ||
                other.unit_code == unit_code) &&
            (identical(other.sale_price1, sale_price1) ||
                other.sale_price1 == sale_price1) &&
            (identical(other.url_image, url_image) ||
                other.url_image == url_image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, average_cost, balance_qty,
      name_1, code, unit_code, sale_price1, url_image);

  /// Create a copy of PosStockItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PosStockItemModelImplCopyWith<_$PosStockItemModelImpl> get copyWith =>
      __$$PosStockItemModelImplCopyWithImpl<_$PosStockItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PosStockItemModelImplToJson(
      this,
    );
  }
}

abstract class _PosStockItemModel implements PosStockItemModel {
  const factory _PosStockItemModel(
      {final String average_cost,
      final int balance_qty,
      final String name_1,
      final String code,
      final String unit_code,
      final String sale_price1,
      final String url_image}) = _$PosStockItemModelImpl;

  factory _PosStockItemModel.fromJson(Map<String, dynamic> json) =
      _$PosStockItemModelImpl.fromJson;

  @override
  String get average_cost;
  @override
  int get balance_qty;
  @override
  String get name_1;
  @override
  String get code;
  @override
  String get unit_code;
  @override
  String get sale_price1;
  @override
  String get url_image;

  /// Create a copy of PosStockItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PosStockItemModelImplCopyWith<_$PosStockItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
