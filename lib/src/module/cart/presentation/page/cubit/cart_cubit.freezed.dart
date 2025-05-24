// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<PosStockItemModel> items,
            int quantity,
            CheckBillModel? checkBill,
            String? docno,
            List<CustomerModel> customer,
            CodeModel? userInfo,
            CustomerModel? selectedCustomer)
        success,
    required TResult Function(String message) error,
    required TResult Function(String html) qrReady,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<PosStockItemModel> items,
            int quantity,
            CheckBillModel? checkBill,
            String? docno,
            List<CustomerModel> customer,
            CodeModel? userInfo,
            CustomerModel? selectedCustomer)?
        success,
    TResult? Function(String message)? error,
    TResult? Function(String html)? qrReady,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<PosStockItemModel> items,
            int quantity,
            CheckBillModel? checkBill,
            String? docno,
            List<CustomerModel> customer,
            CodeModel? userInfo,
            CustomerModel? selectedCustomer)?
        success,
    TResult Function(String message)? error,
    TResult Function(String html)? qrReady,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_QrReady value) qrReady,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_QrReady value)? qrReady,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_QrReady value)? qrReady,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'CartState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<PosStockItemModel> items,
            int quantity,
            CheckBillModel? checkBill,
            String? docno,
            List<CustomerModel> customer,
            CodeModel? userInfo,
            CustomerModel? selectedCustomer)
        success,
    required TResult Function(String message) error,
    required TResult Function(String html) qrReady,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<PosStockItemModel> items,
            int quantity,
            CheckBillModel? checkBill,
            String? docno,
            List<CustomerModel> customer,
            CodeModel? userInfo,
            CustomerModel? selectedCustomer)?
        success,
    TResult? Function(String message)? error,
    TResult? Function(String html)? qrReady,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<PosStockItemModel> items,
            int quantity,
            CheckBillModel? checkBill,
            String? docno,
            List<CustomerModel> customer,
            CodeModel? userInfo,
            CustomerModel? selectedCustomer)?
        success,
    TResult Function(String message)? error,
    TResult Function(String html)? qrReady,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_QrReady value) qrReady,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_QrReady value)? qrReady,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_QrReady value)? qrReady,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CartState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'CartState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<PosStockItemModel> items,
            int quantity,
            CheckBillModel? checkBill,
            String? docno,
            List<CustomerModel> customer,
            CodeModel? userInfo,
            CustomerModel? selectedCustomer)
        success,
    required TResult Function(String message) error,
    required TResult Function(String html) qrReady,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<PosStockItemModel> items,
            int quantity,
            CheckBillModel? checkBill,
            String? docno,
            List<CustomerModel> customer,
            CodeModel? userInfo,
            CustomerModel? selectedCustomer)?
        success,
    TResult? Function(String message)? error,
    TResult? Function(String html)? qrReady,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<PosStockItemModel> items,
            int quantity,
            CheckBillModel? checkBill,
            String? docno,
            List<CustomerModel> customer,
            CodeModel? userInfo,
            CustomerModel? selectedCustomer)?
        success,
    TResult Function(String message)? error,
    TResult Function(String html)? qrReady,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_QrReady value) qrReady,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_QrReady value)? qrReady,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_QrReady value)? qrReady,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CartState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<PosStockItemModel> items,
      int quantity,
      CheckBillModel? checkBill,
      String? docno,
      List<CustomerModel> customer,
      CodeModel? userInfo,
      CustomerModel? selectedCustomer});

  $CheckBillModelCopyWith<$Res>? get checkBill;
  $CodeModelCopyWith<$Res>? get userInfo;
  $CustomerModelCopyWith<$Res>? get selectedCustomer;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? quantity = null,
    Object? checkBill = freezed,
    Object? docno = freezed,
    Object? customer = null,
    Object? userInfo = freezed,
    Object? selectedCustomer = freezed,
  }) {
    return _then(_$SuccessImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PosStockItemModel>,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      checkBill: freezed == checkBill
          ? _value.checkBill
          : checkBill // ignore: cast_nullable_to_non_nullable
              as CheckBillModel?,
      docno: freezed == docno
          ? _value.docno
          : docno // ignore: cast_nullable_to_non_nullable
              as String?,
      customer: null == customer
          ? _value._customer
          : customer // ignore: cast_nullable_to_non_nullable
              as List<CustomerModel>,
      userInfo: freezed == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as CodeModel?,
      selectedCustomer: freezed == selectedCustomer
          ? _value.selectedCustomer
          : selectedCustomer // ignore: cast_nullable_to_non_nullable
              as CustomerModel?,
    ));
  }

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CheckBillModelCopyWith<$Res>? get checkBill {
    if (_value.checkBill == null) {
      return null;
    }

    return $CheckBillModelCopyWith<$Res>(_value.checkBill!, (value) {
      return _then(_value.copyWith(checkBill: value));
    });
  }

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeModelCopyWith<$Res>? get userInfo {
    if (_value.userInfo == null) {
      return null;
    }

    return $CodeModelCopyWith<$Res>(_value.userInfo!, (value) {
      return _then(_value.copyWith(userInfo: value));
    });
  }

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerModelCopyWith<$Res>? get selectedCustomer {
    if (_value.selectedCustomer == null) {
      return null;
    }

    return $CustomerModelCopyWith<$Res>(_value.selectedCustomer!, (value) {
      return _then(_value.copyWith(selectedCustomer: value));
    });
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(
      {final List<PosStockItemModel> items = const [],
      this.quantity = 1,
      this.checkBill,
      this.docno,
      final List<CustomerModel> customer = const [],
      this.userInfo,
      this.selectedCustomer})
      : _items = items,
        _customer = customer;

  final List<PosStockItemModel> _items;
  @override
  @JsonKey()
  List<PosStockItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final int quantity;
  @override
  final CheckBillModel? checkBill;
  @override
  final String? docno;
  final List<CustomerModel> _customer;
  @override
  @JsonKey()
  List<CustomerModel> get customer {
    if (_customer is EqualUnmodifiableListView) return _customer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customer);
  }

  @override
  final CodeModel? userInfo;
  @override
  final CustomerModel? selectedCustomer;

  @override
  String toString() {
    return 'CartState.success(items: $items, quantity: $quantity, checkBill: $checkBill, docno: $docno, customer: $customer, userInfo: $userInfo, selectedCustomer: $selectedCustomer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.checkBill, checkBill) ||
                other.checkBill == checkBill) &&
            (identical(other.docno, docno) || other.docno == docno) &&
            const DeepCollectionEquality().equals(other._customer, _customer) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            (identical(other.selectedCustomer, selectedCustomer) ||
                other.selectedCustomer == selectedCustomer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      quantity,
      checkBill,
      docno,
      const DeepCollectionEquality().hash(_customer),
      userInfo,
      selectedCustomer);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<PosStockItemModel> items,
            int quantity,
            CheckBillModel? checkBill,
            String? docno,
            List<CustomerModel> customer,
            CodeModel? userInfo,
            CustomerModel? selectedCustomer)
        success,
    required TResult Function(String message) error,
    required TResult Function(String html) qrReady,
  }) {
    return success(items, quantity, checkBill, docno, customer, userInfo,
        selectedCustomer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<PosStockItemModel> items,
            int quantity,
            CheckBillModel? checkBill,
            String? docno,
            List<CustomerModel> customer,
            CodeModel? userInfo,
            CustomerModel? selectedCustomer)?
        success,
    TResult? Function(String message)? error,
    TResult? Function(String html)? qrReady,
  }) {
    return success?.call(items, quantity, checkBill, docno, customer, userInfo,
        selectedCustomer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<PosStockItemModel> items,
            int quantity,
            CheckBillModel? checkBill,
            String? docno,
            List<CustomerModel> customer,
            CodeModel? userInfo,
            CustomerModel? selectedCustomer)?
        success,
    TResult Function(String message)? error,
    TResult Function(String html)? qrReady,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(items, quantity, checkBill, docno, customer, userInfo,
          selectedCustomer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_QrReady value) qrReady,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_QrReady value)? qrReady,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_QrReady value)? qrReady,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements CartState {
  const factory _Success(
      {final List<PosStockItemModel> items,
      final int quantity,
      final CheckBillModel? checkBill,
      final String? docno,
      final List<CustomerModel> customer,
      final CodeModel? userInfo,
      final CustomerModel? selectedCustomer}) = _$SuccessImpl;

  List<PosStockItemModel> get items;
  int get quantity;
  CheckBillModel? get checkBill;
  String? get docno;
  List<CustomerModel> get customer;
  CodeModel? get userInfo;
  CustomerModel? get selectedCustomer;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CartState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<PosStockItemModel> items,
            int quantity,
            CheckBillModel? checkBill,
            String? docno,
            List<CustomerModel> customer,
            CodeModel? userInfo,
            CustomerModel? selectedCustomer)
        success,
    required TResult Function(String message) error,
    required TResult Function(String html) qrReady,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<PosStockItemModel> items,
            int quantity,
            CheckBillModel? checkBill,
            String? docno,
            List<CustomerModel> customer,
            CodeModel? userInfo,
            CustomerModel? selectedCustomer)?
        success,
    TResult? Function(String message)? error,
    TResult? Function(String html)? qrReady,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<PosStockItemModel> items,
            int quantity,
            CheckBillModel? checkBill,
            String? docno,
            List<CustomerModel> customer,
            CodeModel? userInfo,
            CustomerModel? selectedCustomer)?
        success,
    TResult Function(String message)? error,
    TResult Function(String html)? qrReady,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_QrReady value) qrReady,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_QrReady value)? qrReady,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_QrReady value)? qrReady,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements CartState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QrReadyImplCopyWith<$Res> {
  factory _$$QrReadyImplCopyWith(
          _$QrReadyImpl value, $Res Function(_$QrReadyImpl) then) =
      __$$QrReadyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String html});
}

/// @nodoc
class __$$QrReadyImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$QrReadyImpl>
    implements _$$QrReadyImplCopyWith<$Res> {
  __$$QrReadyImplCopyWithImpl(
      _$QrReadyImpl _value, $Res Function(_$QrReadyImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? html = null,
  }) {
    return _then(_$QrReadyImpl(
      html: null == html
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$QrReadyImpl implements _QrReady {
  const _$QrReadyImpl({required this.html});

  @override
  final String html;

  @override
  String toString() {
    return 'CartState.qrReady(html: $html)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrReadyImpl &&
            (identical(other.html, html) || other.html == html));
  }

  @override
  int get hashCode => Object.hash(runtimeType, html);

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QrReadyImplCopyWith<_$QrReadyImpl> get copyWith =>
      __$$QrReadyImplCopyWithImpl<_$QrReadyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<PosStockItemModel> items,
            int quantity,
            CheckBillModel? checkBill,
            String? docno,
            List<CustomerModel> customer,
            CodeModel? userInfo,
            CustomerModel? selectedCustomer)
        success,
    required TResult Function(String message) error,
    required TResult Function(String html) qrReady,
  }) {
    return qrReady(html);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<PosStockItemModel> items,
            int quantity,
            CheckBillModel? checkBill,
            String? docno,
            List<CustomerModel> customer,
            CodeModel? userInfo,
            CustomerModel? selectedCustomer)?
        success,
    TResult? Function(String message)? error,
    TResult? Function(String html)? qrReady,
  }) {
    return qrReady?.call(html);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<PosStockItemModel> items,
            int quantity,
            CheckBillModel? checkBill,
            String? docno,
            List<CustomerModel> customer,
            CodeModel? userInfo,
            CustomerModel? selectedCustomer)?
        success,
    TResult Function(String message)? error,
    TResult Function(String html)? qrReady,
    required TResult orElse(),
  }) {
    if (qrReady != null) {
      return qrReady(html);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
    required TResult Function(_QrReady value) qrReady,
  }) {
    return qrReady(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
    TResult? Function(_QrReady value)? qrReady,
  }) {
    return qrReady?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    TResult Function(_QrReady value)? qrReady,
    required TResult orElse(),
  }) {
    if (qrReady != null) {
      return qrReady(this);
    }
    return orElse();
  }
}

abstract class _QrReady implements CartState {
  const factory _QrReady({required final String html}) = _$QrReadyImpl;

  String get html;

  /// Create a copy of CartState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QrReadyImplCopyWith<_$QrReadyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
