// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 List<ProductEntity>? get originalProduct; List<ProductEntity>? get listProduct;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&const DeepCollectionEquality().equals(other.originalProduct, originalProduct)&&const DeepCollectionEquality().equals(other.listProduct, listProduct));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(originalProduct),const DeepCollectionEquality().hash(listProduct));

@override
String toString() {
  return 'HomeState(originalProduct: $originalProduct, listProduct: $listProduct)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 List<ProductEntity>? originalProduct, List<ProductEntity>? listProduct
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? originalProduct = freezed,Object? listProduct = freezed,}) {
  return _then(_self.copyWith(
originalProduct: freezed == originalProduct ? _self.originalProduct : originalProduct // ignore: cast_nullable_to_non_nullable
as List<ProductEntity>?,listProduct: freezed == listProduct ? _self.listProduct : listProduct // ignore: cast_nullable_to_non_nullable
as List<ProductEntity>?,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ProductEntity>? originalProduct,  List<ProductEntity>? listProduct)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.originalProduct,_that.listProduct);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ProductEntity>? originalProduct,  List<ProductEntity>? listProduct)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.originalProduct,_that.listProduct);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ProductEntity>? originalProduct,  List<ProductEntity>? listProduct)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.originalProduct,_that.listProduct);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState extends HomeState {
  const _HomeState({final  List<ProductEntity>? originalProduct, final  List<ProductEntity>? listProduct}): _originalProduct = originalProduct,_listProduct = listProduct,super._();
  

 final  List<ProductEntity>? _originalProduct;
@override List<ProductEntity>? get originalProduct {
  final value = _originalProduct;
  if (value == null) return null;
  if (_originalProduct is EqualUnmodifiableListView) return _originalProduct;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ProductEntity>? _listProduct;
@override List<ProductEntity>? get listProduct {
  final value = _listProduct;
  if (value == null) return null;
  if (_listProduct is EqualUnmodifiableListView) return _listProduct;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&const DeepCollectionEquality().equals(other._originalProduct, _originalProduct)&&const DeepCollectionEquality().equals(other._listProduct, _listProduct));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_originalProduct),const DeepCollectionEquality().hash(_listProduct));

@override
String toString() {
  return 'HomeState(originalProduct: $originalProduct, listProduct: $listProduct)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 List<ProductEntity>? originalProduct, List<ProductEntity>? listProduct
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? originalProduct = freezed,Object? listProduct = freezed,}) {
  return _then(_HomeState(
originalProduct: freezed == originalProduct ? _self._originalProduct : originalProduct // ignore: cast_nullable_to_non_nullable
as List<ProductEntity>?,listProduct: freezed == listProduct ? _self._listProduct : listProduct // ignore: cast_nullable_to_non_nullable
as List<ProductEntity>?,
  ));
}


}

// dart format on
