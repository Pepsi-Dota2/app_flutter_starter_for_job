// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FilterProductModel _$FilterProductModelFromJson(Map<String, dynamic> json) {
  return _FilterProductModel.fromJson(json);
}

/// @nodoc
mixin _$FilterProductModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  /// Serializes this FilterProductModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FilterProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterProductModelCopyWith<FilterProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterProductModelCopyWith<$Res> {
  factory $FilterProductModelCopyWith(
          FilterProductModel value, $Res Function(FilterProductModel) then) =
      _$FilterProductModelCopyWithImpl<$Res, FilterProductModel>;
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class _$FilterProductModelCopyWithImpl<$Res, $Val extends FilterProductModel>
    implements $FilterProductModelCopyWith<$Res> {
  _$FilterProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilterProductModelImplCopyWith<$Res>
    implements $FilterProductModelCopyWith<$Res> {
  factory _$$FilterProductModelImplCopyWith(_$FilterProductModelImpl value,
          $Res Function(_$FilterProductModelImpl) then) =
      __$$FilterProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title});
}

/// @nodoc
class __$$FilterProductModelImplCopyWithImpl<$Res>
    extends _$FilterProductModelCopyWithImpl<$Res, _$FilterProductModelImpl>
    implements _$$FilterProductModelImplCopyWith<$Res> {
  __$$FilterProductModelImplCopyWithImpl(_$FilterProductModelImpl _value,
      $Res Function(_$FilterProductModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FilterProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
  }) {
    return _then(_$FilterProductModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FilterProductModelImpl implements _FilterProductModel {
  const _$FilterProductModelImpl({this.id = 0, this.title = ""});

  factory _$FilterProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilterProductModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String title;

  @override
  String toString() {
    return 'FilterProductModel(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  /// Create a copy of FilterProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterProductModelImplCopyWith<_$FilterProductModelImpl> get copyWith =>
      __$$FilterProductModelImplCopyWithImpl<_$FilterProductModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FilterProductModelImplToJson(
      this,
    );
  }
}

abstract class _FilterProductModel implements FilterProductModel {
  const factory _FilterProductModel({final int id, final String title}) =
      _$FilterProductModelImpl;

  factory _FilterProductModel.fromJson(Map<String, dynamic> json) =
      _$FilterProductModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;

  /// Create a copy of FilterProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterProductModelImplCopyWith<_$FilterProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
