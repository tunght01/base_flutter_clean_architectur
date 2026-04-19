// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_product_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DetailProductState {

 ProductEntity? get product; String? get id; bool get isEdit;
/// Create a copy of DetailProductState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailProductStateCopyWith<DetailProductState> get copyWith => _$DetailProductStateCopyWithImpl<DetailProductState>(this as DetailProductState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailProductState&&(identical(other.product, product) || other.product == product)&&(identical(other.id, id) || other.id == id)&&(identical(other.isEdit, isEdit) || other.isEdit == isEdit));
}


@override
int get hashCode => Object.hash(runtimeType,product,id,isEdit);

@override
String toString() {
  return 'DetailProductState(product: $product, id: $id, isEdit: $isEdit)';
}


}

/// @nodoc
abstract mixin class $DetailProductStateCopyWith<$Res>  {
  factory $DetailProductStateCopyWith(DetailProductState value, $Res Function(DetailProductState) _then) = _$DetailProductStateCopyWithImpl;
@useResult
$Res call({
 ProductEntity? product, String? id, bool isEdit
});




}
/// @nodoc
class _$DetailProductStateCopyWithImpl<$Res>
    implements $DetailProductStateCopyWith<$Res> {
  _$DetailProductStateCopyWithImpl(this._self, this._then);

  final DetailProductState _self;
  final $Res Function(DetailProductState) _then;

/// Create a copy of DetailProductState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? product = freezed,Object? id = freezed,Object? isEdit = null,}) {
  return _then(_self.copyWith(
product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductEntity?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,isEdit: null == isEdit ? _self.isEdit : isEdit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DetailProductState].
extension DetailProductStatePatterns on DetailProductState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailProductState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailProductState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailProductState value)  $default,){
final _that = this;
switch (_that) {
case _DetailProductState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailProductState value)?  $default,){
final _that = this;
switch (_that) {
case _DetailProductState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProductEntity? product,  String? id,  bool isEdit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailProductState() when $default != null:
return $default(_that.product,_that.id,_that.isEdit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProductEntity? product,  String? id,  bool isEdit)  $default,) {final _that = this;
switch (_that) {
case _DetailProductState():
return $default(_that.product,_that.id,_that.isEdit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProductEntity? product,  String? id,  bool isEdit)?  $default,) {final _that = this;
switch (_that) {
case _DetailProductState() when $default != null:
return $default(_that.product,_that.id,_that.isEdit);case _:
  return null;

}
}

}

/// @nodoc


class _DetailProductState extends DetailProductState {
  const _DetailProductState({this.product, this.id, this.isEdit = false}): super._();
  

@override final  ProductEntity? product;
@override final  String? id;
@override@JsonKey() final  bool isEdit;

/// Create a copy of DetailProductState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailProductStateCopyWith<_DetailProductState> get copyWith => __$DetailProductStateCopyWithImpl<_DetailProductState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailProductState&&(identical(other.product, product) || other.product == product)&&(identical(other.id, id) || other.id == id)&&(identical(other.isEdit, isEdit) || other.isEdit == isEdit));
}


@override
int get hashCode => Object.hash(runtimeType,product,id,isEdit);

@override
String toString() {
  return 'DetailProductState(product: $product, id: $id, isEdit: $isEdit)';
}


}

/// @nodoc
abstract mixin class _$DetailProductStateCopyWith<$Res> implements $DetailProductStateCopyWith<$Res> {
  factory _$DetailProductStateCopyWith(_DetailProductState value, $Res Function(_DetailProductState) _then) = __$DetailProductStateCopyWithImpl;
@override @useResult
$Res call({
 ProductEntity? product, String? id, bool isEdit
});




}
/// @nodoc
class __$DetailProductStateCopyWithImpl<$Res>
    implements _$DetailProductStateCopyWith<$Res> {
  __$DetailProductStateCopyWithImpl(this._self, this._then);

  final _DetailProductState _self;
  final $Res Function(_DetailProductState) _then;

/// Create a copy of DetailProductState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? product = freezed,Object? id = freezed,Object? isEdit = null,}) {
  return _then(_DetailProductState(
product: freezed == product ? _self.product : product // ignore: cast_nullable_to_non_nullable
as ProductEntity?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,isEdit: null == isEdit ? _self.isEdit : isEdit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
