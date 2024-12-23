// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetProductionModel _$GetProductionModelFromJson(Map<String, dynamic> json) {
  return _GetProductionModel.fromJson(json);
}

/// @nodoc
mixin _$GetProductionModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;

  /// Serializes this GetProductionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetProductionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetProductionModelCopyWith<GetProductionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetProductionModelCopyWith<$Res> {
  factory $GetProductionModelCopyWith(
          GetProductionModel value, $Res Function(GetProductionModel) then) =
      _$GetProductionModelCopyWithImpl<$Res, GetProductionModel>;
  @useResult
  $Res call(
      {int id,
      String title,
      int price,
      String description,
      List<String> images});
}

/// @nodoc
class _$GetProductionModelCopyWithImpl<$Res, $Val extends GetProductionModel>
    implements $GetProductionModelCopyWith<$Res> {
  _$GetProductionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetProductionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = null,
    Object? description = null,
    Object? images = null,
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
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetProductionModelImplCopyWith<$Res>
    implements $GetProductionModelCopyWith<$Res> {
  factory _$$GetProductionModelImplCopyWith(_$GetProductionModelImpl value,
          $Res Function(_$GetProductionModelImpl) then) =
      __$$GetProductionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      int price,
      String description,
      List<String> images});
}

/// @nodoc
class __$$GetProductionModelImplCopyWithImpl<$Res>
    extends _$GetProductionModelCopyWithImpl<$Res, _$GetProductionModelImpl>
    implements _$$GetProductionModelImplCopyWith<$Res> {
  __$$GetProductionModelImplCopyWithImpl(_$GetProductionModelImpl _value,
      $Res Function(_$GetProductionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetProductionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = null,
    Object? description = null,
    Object? images = null,
  }) {
    return _then(_$GetProductionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetProductionModelImpl
    with DiagnosticableTreeMixin
    implements _GetProductionModel {
  const _$GetProductionModelImpl(
      {this.id = 0,
      this.title = '',
      this.price = 0,
      this.description = '',
      final List<String> images = const []})
      : _images = images;

  factory _$GetProductionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetProductionModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final int price;
  @override
  @JsonKey()
  final String description;
  final List<String> _images;
  @override
  @JsonKey()
  List<String> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GetProductionModel(id: $id, title: $title, price: $price, description: $description, images: $images)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GetProductionModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('images', images));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProductionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, price, description,
      const DeepCollectionEquality().hash(_images));

  /// Create a copy of GetProductionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProductionModelImplCopyWith<_$GetProductionModelImpl> get copyWith =>
      __$$GetProductionModelImplCopyWithImpl<_$GetProductionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetProductionModelImplToJson(
      this,
    );
  }
}

abstract class _GetProductionModel implements GetProductionModel {
  const factory _GetProductionModel(
      {final int id,
      final String title,
      final int price,
      final String description,
      final List<String> images}) = _$GetProductionModelImpl;

  factory _GetProductionModel.fromJson(Map<String, dynamic> json) =
      _$GetProductionModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  int get price;
  @override
  String get description;
  @override
  List<String> get images;

  /// Create a copy of GetProductionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetProductionModelImplCopyWith<_$GetProductionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
