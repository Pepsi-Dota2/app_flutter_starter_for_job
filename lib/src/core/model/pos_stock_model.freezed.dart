// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pos_stock_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PosStockModel _$PosStockModelFromJson(Map<String, dynamic> json) {
  return _PosStockModel.fromJson(json);
}

/// @nodoc
mixin _$PosStockModel {
  String get wh_code => throw _privateConstructorUsedError;
  String get sh_code => throw _privateConstructorUsedError;
  String get cust_group_main => throw _privateConstructorUsedError;
  String get cust_group_sub => throw _privateConstructorUsedError;
  String get currency_code => throw _privateConstructorUsedError;
  String get group_main => throw _privateConstructorUsedError;

  /// Serializes this PosStockModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PosStockModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PosStockModelCopyWith<PosStockModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PosStockModelCopyWith<$Res> {
  factory $PosStockModelCopyWith(
          PosStockModel value, $Res Function(PosStockModel) then) =
      _$PosStockModelCopyWithImpl<$Res, PosStockModel>;
  @useResult
  $Res call(
      {String wh_code,
      String sh_code,
      String cust_group_main,
      String cust_group_sub,
      String currency_code,
      String group_main});
}

/// @nodoc
class _$PosStockModelCopyWithImpl<$Res, $Val extends PosStockModel>
    implements $PosStockModelCopyWith<$Res> {
  _$PosStockModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PosStockModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wh_code = null,
    Object? sh_code = null,
    Object? cust_group_main = null,
    Object? cust_group_sub = null,
    Object? currency_code = null,
    Object? group_main = null,
  }) {
    return _then(_value.copyWith(
      wh_code: null == wh_code
          ? _value.wh_code
          : wh_code // ignore: cast_nullable_to_non_nullable
              as String,
      sh_code: null == sh_code
          ? _value.sh_code
          : sh_code // ignore: cast_nullable_to_non_nullable
              as String,
      cust_group_main: null == cust_group_main
          ? _value.cust_group_main
          : cust_group_main // ignore: cast_nullable_to_non_nullable
              as String,
      cust_group_sub: null == cust_group_sub
          ? _value.cust_group_sub
          : cust_group_sub // ignore: cast_nullable_to_non_nullable
              as String,
      currency_code: null == currency_code
          ? _value.currency_code
          : currency_code // ignore: cast_nullable_to_non_nullable
              as String,
      group_main: null == group_main
          ? _value.group_main
          : group_main // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PosStockModelImplCopyWith<$Res>
    implements $PosStockModelCopyWith<$Res> {
  factory _$$PosStockModelImplCopyWith(
          _$PosStockModelImpl value, $Res Function(_$PosStockModelImpl) then) =
      __$$PosStockModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String wh_code,
      String sh_code,
      String cust_group_main,
      String cust_group_sub,
      String currency_code,
      String group_main});
}

/// @nodoc
class __$$PosStockModelImplCopyWithImpl<$Res>
    extends _$PosStockModelCopyWithImpl<$Res, _$PosStockModelImpl>
    implements _$$PosStockModelImplCopyWith<$Res> {
  __$$PosStockModelImplCopyWithImpl(
      _$PosStockModelImpl _value, $Res Function(_$PosStockModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PosStockModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wh_code = null,
    Object? sh_code = null,
    Object? cust_group_main = null,
    Object? cust_group_sub = null,
    Object? currency_code = null,
    Object? group_main = null,
  }) {
    return _then(_$PosStockModelImpl(
      wh_code: null == wh_code
          ? _value.wh_code
          : wh_code // ignore: cast_nullable_to_non_nullable
              as String,
      sh_code: null == sh_code
          ? _value.sh_code
          : sh_code // ignore: cast_nullable_to_non_nullable
              as String,
      cust_group_main: null == cust_group_main
          ? _value.cust_group_main
          : cust_group_main // ignore: cast_nullable_to_non_nullable
              as String,
      cust_group_sub: null == cust_group_sub
          ? _value.cust_group_sub
          : cust_group_sub // ignore: cast_nullable_to_non_nullable
              as String,
      currency_code: null == currency_code
          ? _value.currency_code
          : currency_code // ignore: cast_nullable_to_non_nullable
              as String,
      group_main: null == group_main
          ? _value.group_main
          : group_main // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PosStockModelImpl implements _PosStockModel {
  const _$PosStockModelImpl(
      {this.wh_code = "",
      this.sh_code = "",
      this.cust_group_main = "",
      this.cust_group_sub = "",
      this.currency_code = "",
      this.group_main = ""});

  factory _$PosStockModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PosStockModelImplFromJson(json);

  @override
  @JsonKey()
  final String wh_code;
  @override
  @JsonKey()
  final String sh_code;
  @override
  @JsonKey()
  final String cust_group_main;
  @override
  @JsonKey()
  final String cust_group_sub;
  @override
  @JsonKey()
  final String currency_code;
  @override
  @JsonKey()
  final String group_main;

  @override
  String toString() {
    return 'PosStockModel(wh_code: $wh_code, sh_code: $sh_code, cust_group_main: $cust_group_main, cust_group_sub: $cust_group_sub, currency_code: $currency_code, group_main: $group_main)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PosStockModelImpl &&
            (identical(other.wh_code, wh_code) || other.wh_code == wh_code) &&
            (identical(other.sh_code, sh_code) || other.sh_code == sh_code) &&
            (identical(other.cust_group_main, cust_group_main) ||
                other.cust_group_main == cust_group_main) &&
            (identical(other.cust_group_sub, cust_group_sub) ||
                other.cust_group_sub == cust_group_sub) &&
            (identical(other.currency_code, currency_code) ||
                other.currency_code == currency_code) &&
            (identical(other.group_main, group_main) ||
                other.group_main == group_main));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, wh_code, sh_code,
      cust_group_main, cust_group_sub, currency_code, group_main);

  /// Create a copy of PosStockModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PosStockModelImplCopyWith<_$PosStockModelImpl> get copyWith =>
      __$$PosStockModelImplCopyWithImpl<_$PosStockModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PosStockModelImplToJson(
      this,
    );
  }
}

abstract class _PosStockModel implements PosStockModel {
  const factory _PosStockModel(
      {final String wh_code,
      final String sh_code,
      final String cust_group_main,
      final String cust_group_sub,
      final String currency_code,
      final String group_main}) = _$PosStockModelImpl;

  factory _PosStockModel.fromJson(Map<String, dynamic> json) =
      _$PosStockModelImpl.fromJson;

  @override
  String get wh_code;
  @override
  String get sh_code;
  @override
  String get cust_group_main;
  @override
  String get cust_group_sub;
  @override
  String get currency_code;
  @override
  String get group_main;

  /// Create a copy of PosStockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PosStockModelImplCopyWith<_$PosStockModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
