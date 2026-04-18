// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_route_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppRouteInfo {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppRouteInfo);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppRouteInfo()';
}


}

/// @nodoc
class $AppRouteInfoCopyWith<$Res>  {
$AppRouteInfoCopyWith(AppRouteInfo _, $Res Function(AppRouteInfo) __);
}


/// Adds pattern-matching-related methods to [AppRouteInfo].
extension AppRouteInfoPatterns on AppRouteInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _OpenAccount value)?  openAccount,TResult Function( _ForgotPassword value)?  forgotPassword,TResult Function( _Login value)?  login,TResult Function( _Main value)?  main,TResult Function( _ProductDetail value)?  productDetail,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpenAccount() when openAccount != null:
return openAccount(_that);case _ForgotPassword() when forgotPassword != null:
return forgotPassword(_that);case _Login() when login != null:
return login(_that);case _Main() when main != null:
return main(_that);case _ProductDetail() when productDetail != null:
return productDetail(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _OpenAccount value)  openAccount,required TResult Function( _ForgotPassword value)  forgotPassword,required TResult Function( _Login value)  login,required TResult Function( _Main value)  main,required TResult Function( _ProductDetail value)  productDetail,}){
final _that = this;
switch (_that) {
case _OpenAccount():
return openAccount(_that);case _ForgotPassword():
return forgotPassword(_that);case _Login():
return login(_that);case _Main():
return main(_that);case _ProductDetail():
return productDetail(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _OpenAccount value)?  openAccount,TResult? Function( _ForgotPassword value)?  forgotPassword,TResult? Function( _Login value)?  login,TResult? Function( _Main value)?  main,TResult? Function( _ProductDetail value)?  productDetail,}){
final _that = this;
switch (_that) {
case _OpenAccount() when openAccount != null:
return openAccount(_that);case _ForgotPassword() when forgotPassword != null:
return forgotPassword(_that);case _Login() when login != null:
return login(_that);case _Main() when main != null:
return main(_that);case _ProductDetail() when productDetail != null:
return productDetail(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  openAccount,TResult Function()?  forgotPassword,TResult Function()?  login,TResult Function()?  main,TResult Function( String id)?  productDetail,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpenAccount() when openAccount != null:
return openAccount();case _ForgotPassword() when forgotPassword != null:
return forgotPassword();case _Login() when login != null:
return login();case _Main() when main != null:
return main();case _ProductDetail() when productDetail != null:
return productDetail(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  openAccount,required TResult Function()  forgotPassword,required TResult Function()  login,required TResult Function()  main,required TResult Function( String id)  productDetail,}) {final _that = this;
switch (_that) {
case _OpenAccount():
return openAccount();case _ForgotPassword():
return forgotPassword();case _Login():
return login();case _Main():
return main();case _ProductDetail():
return productDetail(_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  openAccount,TResult? Function()?  forgotPassword,TResult? Function()?  login,TResult? Function()?  main,TResult? Function( String id)?  productDetail,}) {final _that = this;
switch (_that) {
case _OpenAccount() when openAccount != null:
return openAccount();case _ForgotPassword() when forgotPassword != null:
return forgotPassword();case _Login() when login != null:
return login();case _Main() when main != null:
return main();case _ProductDetail() when productDetail != null:
return productDetail(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _OpenAccount extends AppRouteInfo {
  const _OpenAccount(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenAccount);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppRouteInfo.openAccount()';
}


}




/// @nodoc


class _ForgotPassword extends AppRouteInfo {
  const _ForgotPassword(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForgotPassword);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppRouteInfo.forgotPassword()';
}


}




/// @nodoc


class _Login extends AppRouteInfo {
  const _Login(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Login);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppRouteInfo.login()';
}


}




/// @nodoc


class _Main extends AppRouteInfo {
  const _Main(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Main);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppRouteInfo.main()';
}


}




/// @nodoc


class _ProductDetail extends AppRouteInfo {
  const _ProductDetail({required this.id}): super._();
  

 final  String id;

/// Create a copy of AppRouteInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductDetailCopyWith<_ProductDetail> get copyWith => __$ProductDetailCopyWithImpl<_ProductDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductDetail&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'AppRouteInfo.productDetail(id: $id)';
}


}

/// @nodoc
abstract mixin class _$ProductDetailCopyWith<$Res> implements $AppRouteInfoCopyWith<$Res> {
  factory _$ProductDetailCopyWith(_ProductDetail value, $Res Function(_ProductDetail) _then) = __$ProductDetailCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class __$ProductDetailCopyWithImpl<$Res>
    implements _$ProductDetailCopyWith<$Res> {
  __$ProductDetailCopyWithImpl(this._self, this._then);

  final _ProductDetail _self;
  final $Res Function(_ProductDetail) _then;

/// Create a copy of AppRouteInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_ProductDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
