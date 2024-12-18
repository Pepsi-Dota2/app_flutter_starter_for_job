// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_product_model.dart';

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
  int get albumId => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get thumbnailUrl => throw _privateConstructorUsedError;

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
      {int albumId, int id, String title, String url, String thumbnailUrl});
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
    Object? albumId = null,
    Object? id = null,
    Object? title = null,
    Object? url = null,
    Object? thumbnailUrl = null,
  }) {
    return _then(_value.copyWith(
      albumId: null == albumId
          ? _value.albumId
          : albumId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
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
      {int albumId, int id, String title, String url, String thumbnailUrl});
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
    Object? albumId = null,
    Object? id = null,
    Object? title = null,
    Object? url = null,
    Object? thumbnailUrl = null,
  }) {
    return _then(_$GetProductModelImpl(
      albumId: null == albumId
          ? _value.albumId
          : albumId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetProductModelImpl implements _GetProductModel {
  const _$GetProductModelImpl(
      {this.albumId = 0,
      this.id = 0,
      this.title = "",
      this.url = "",
      this.thumbnailUrl = ""});

  factory _$GetProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetProductModelImplFromJson(json);

  @override
  @JsonKey()
  final int albumId;
  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey()
  final String thumbnailUrl;

  @override
  String toString() {
    return 'GetProductModel(albumId: $albumId, id: $id, title: $title, url: $url, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProductModelImpl &&
            (identical(other.albumId, albumId) || other.albumId == albumId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, albumId, id, title, url, thumbnailUrl);

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
      {final int albumId,
      final int id,
      final String title,
      final String url,
      final String thumbnailUrl}) = _$GetProductModelImpl;

  factory _GetProductModel.fromJson(Map<String, dynamic> json) =
      _$GetProductModelImpl.fromJson;

  @override
  int get albumId;
  @override
  int get id;
  @override
  String get title;
  @override
  String get url;
  @override
  String get thumbnailUrl;

  /// Create a copy of GetProductModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetProductModelImplCopyWith<_$GetProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
