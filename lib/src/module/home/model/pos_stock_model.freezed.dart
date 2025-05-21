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
  bool get has_more => throw _privateConstructorUsedError;
  dynamic get limit => throw _privateConstructorUsedError;
  List<PosStockItemModel> get list => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get total_rows => throw _privateConstructorUsedError;

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
      {bool has_more,
      dynamic limit,
      List<PosStockItemModel> list,
      int page,
      int total_rows});
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
    Object? has_more = null,
    Object? limit = freezed,
    Object? list = null,
    Object? page = null,
    Object? total_rows = null,
  }) {
    return _then(_value.copyWith(
      has_more: null == has_more
          ? _value.has_more
          : has_more // ignore: cast_nullable_to_non_nullable
              as bool,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as dynamic,
      list: null == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<PosStockItemModel>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total_rows: null == total_rows
          ? _value.total_rows
          : total_rows // ignore: cast_nullable_to_non_nullable
              as int,
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
      {bool has_more,
      dynamic limit,
      List<PosStockItemModel> list,
      int page,
      int total_rows});
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
    Object? has_more = null,
    Object? limit = freezed,
    Object? list = null,
    Object? page = null,
    Object? total_rows = null,
  }) {
    return _then(_$PosStockModelImpl(
      has_more: null == has_more
          ? _value.has_more
          : has_more // ignore: cast_nullable_to_non_nullable
              as bool,
      limit: freezed == limit ? _value.limit! : limit,
      list: null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<PosStockItemModel>,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      total_rows: null == total_rows
          ? _value.total_rows
          : total_rows // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PosStockModelImpl implements _PosStockModel {
  const _$PosStockModelImpl(
      {this.has_more = false,
      this.limit = 0,
      final List<PosStockItemModel> list = const [],
      this.page = 0,
      this.total_rows = 0})
      : _list = list;

  factory _$PosStockModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PosStockModelImplFromJson(json);

  @override
  @JsonKey()
  final bool has_more;
  @override
  @JsonKey()
  final dynamic limit;
  final List<PosStockItemModel> _list;
  @override
  @JsonKey()
  List<PosStockItemModel> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int total_rows;

  @override
  String toString() {
    return 'PosStockModel(has_more: $has_more, limit: $limit, list: $list, page: $page, total_rows: $total_rows)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PosStockModelImpl &&
            (identical(other.has_more, has_more) ||
                other.has_more == has_more) &&
            const DeepCollectionEquality().equals(other.limit, limit) &&
            const DeepCollectionEquality().equals(other._list, _list) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.total_rows, total_rows) ||
                other.total_rows == total_rows));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      has_more,
      const DeepCollectionEquality().hash(limit),
      const DeepCollectionEquality().hash(_list),
      page,
      total_rows);

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
      {final bool has_more,
      final dynamic limit,
      final List<PosStockItemModel> list,
      final int page,
      final int total_rows}) = _$PosStockModelImpl;

  factory _PosStockModel.fromJson(Map<String, dynamic> json) =
      _$PosStockModelImpl.fromJson;

  @override
  bool get has_more;
  @override
  dynamic get limit;
  @override
  List<PosStockItemModel> get list;
  @override
  int get page;
  @override
  int get total_rows;

  /// Create a copy of PosStockModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PosStockModelImplCopyWith<_$PosStockModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
