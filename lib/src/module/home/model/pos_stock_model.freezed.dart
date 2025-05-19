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
  List<PosStockItemModel> get list => throw _privateConstructorUsedError;

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
  $Res call({List<PosStockItemModel> list});
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
    Object? list = null,
  }) {
    return _then(_value.copyWith(
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<PosStockItemModel>,
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
  $Res call({List<PosStockItemModel> list});
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
    Object? list = null,
  }) {
    return _then(_$PosStockModelImpl(
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<PosStockItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PosStockModelImpl implements _PosStockModel {
  const _$PosStockModelImpl({final List<PosStockItemModel> list = const []})
      : _list = list;

  factory _$PosStockModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PosStockModelImplFromJson(json);

  final List<PosStockItemModel> _list;
  @override
  @JsonKey()
  List<PosStockItemModel> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'PosStockModel(list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PosStockModelImpl &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

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
  const factory _PosStockModel({final List<PosStockItemModel> list}) =
      _$PosStockModelImpl;

  factory _PosStockModel.fromJson(Map<String, dynamic> json) =
      _$PosStockModelImpl.fromJson;

  @override
  List<PosStockItemModel> get list;

  /// Create a copy of PosStockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PosStockModelImplCopyWith<_$PosStockModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
