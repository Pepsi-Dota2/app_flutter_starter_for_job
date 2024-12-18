// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_products_luxury_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetProductModel _$GetProductModelFromJson(Map<String, dynamic> json) {
  return _GetProductModel.fromJson(json);
}

/// @nodoc
mixin _$GetProductModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  List<CategoryModel> get category => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get images => throw _privateConstructorUsedError;

  /// Serializes this GetProductModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetProductModelCopyWith<GetProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetProductModelCopyWith<$Res> {
  factory $GetProductModelCopyWith(
          GetProductModel value, $Res Function(GetProductModel) then) =
      _$GetProductModelCopyWithImpl<$Res, GetProductModel>;
  @useResult
  $Res call(
      {int id,
      String title,
      int price,
      List<CategoryModel> category,
      String description,
      List<String> images});
}

/// @nodoc
class _$GetProductModelCopyWithImpl<$Res, $Val extends GetProductModel>
    implements $GetProductModelCopyWith<$Res> {
  _$GetProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = null,
    Object? category = null,
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
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
abstract class _$$GetProductModelImplCopyWith<$Res>
    implements $GetProductModelCopyWith<$Res> {
  factory _$$GetProductModelImplCopyWith(_$GetProductModelImpl value,
          $Res Function(_$GetProductModelImpl) then) =
      __$$GetProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      int price,
      List<CategoryModel> category,
      String description,
      List<String> images});
}

/// @nodoc
class __$$GetProductModelImplCopyWithImpl<$Res>
    extends _$GetProductModelCopyWithImpl<$Res, _$GetProductModelImpl>
    implements _$$GetProductModelImplCopyWith<$Res> {
  __$$GetProductModelImplCopyWithImpl(
      _$GetProductModelImpl _value, $Res Function(_$GetProductModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetProductModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = null,
    Object? category = null,
    Object? description = null,
    Object? images = null,
  }) {
    return _then(_$GetProductModelImpl(
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
      category: null == category
          ? _value._category
          : category // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
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
class _$GetProductModelImpl implements _GetProductModel {
  const _$GetProductModelImpl(
      {this.id = 0,
      this.title = "",
      this.price = 0,
      final List<CategoryModel> category = const [],
      this.description = "",
      final List<String> images = const []})
      : _category = category,
        _images = images;

  factory _$GetProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetProductModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final int price;
  final List<CategoryModel> _category;
  @override
  @JsonKey()
  List<CategoryModel> get category {
    if (_category is EqualUnmodifiableListView) return _category;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_category);
  }

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
  String toString() {
    return 'GetProductModel(id: $id, title: $title, price: $price, category: $category, description: $description, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality().equals(other._category, _category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      price,
      const DeepCollectionEquality().hash(_category),
      description,
      const DeepCollectionEquality().hash(_images));

  /// Create a copy of GetProductModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProductModelImplCopyWith<_$GetProductModelImpl> get copyWith =>
      __$$GetProductModelImplCopyWithImpl<_$GetProductModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetProductModelImplToJson(
      this,
    );
  }
}

abstract class _GetProductModel implements GetProductModel {
  const factory _GetProductModel(
      {final int id,
      final String title,
      final int price,
      final List<CategoryModel> category,
      final String description,
      final List<String> images}) = _$GetProductModelImpl;

  factory _GetProductModel.fromJson(Map<String, dynamic> json) =
      _$GetProductModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  int get price;
  @override
  List<CategoryModel> get category;
  @override
  String get description;
  @override
  List<String> get images;

  /// Create a copy of GetProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetProductModelImplCopyWith<_$GetProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
