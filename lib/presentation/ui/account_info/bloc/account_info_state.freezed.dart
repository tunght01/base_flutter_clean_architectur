// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_info_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AccountInfoState {

 AccountInfo? get accountInfo; bool get isEdit;
/// Create a copy of AccountInfoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountInfoStateCopyWith<AccountInfoState> get copyWith => _$AccountInfoStateCopyWithImpl<AccountInfoState>(this as AccountInfoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountInfoState&&(identical(other.accountInfo, accountInfo) || other.accountInfo == accountInfo)&&(identical(other.isEdit, isEdit) || other.isEdit == isEdit));
}


@override
int get hashCode => Object.hash(runtimeType,accountInfo,isEdit);

@override
String toString() {
  return 'AccountInfoState(accountInfo: $accountInfo, isEdit: $isEdit)';
}


}

/// @nodoc
abstract mixin class $AccountInfoStateCopyWith<$Res>  {
  factory $AccountInfoStateCopyWith(AccountInfoState value, $Res Function(AccountInfoState) _then) = _$AccountInfoStateCopyWithImpl;
@useResult
$Res call({
 AccountInfo? accountInfo, bool isEdit
});




}
/// @nodoc
class _$AccountInfoStateCopyWithImpl<$Res>
    implements $AccountInfoStateCopyWith<$Res> {
  _$AccountInfoStateCopyWithImpl(this._self, this._then);

  final AccountInfoState _self;
  final $Res Function(AccountInfoState) _then;

/// Create a copy of AccountInfoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountInfo = freezed,Object? isEdit = null,}) {
  return _then(_self.copyWith(
accountInfo: freezed == accountInfo ? _self.accountInfo : accountInfo // ignore: cast_nullable_to_non_nullable
as AccountInfo?,isEdit: null == isEdit ? _self.isEdit : isEdit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountInfoState].
extension AccountInfoStatePatterns on AccountInfoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountInfoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountInfoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountInfoState value)  $default,){
final _that = this;
switch (_that) {
case _AccountInfoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountInfoState value)?  $default,){
final _that = this;
switch (_that) {
case _AccountInfoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AccountInfo? accountInfo,  bool isEdit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountInfoState() when $default != null:
return $default(_that.accountInfo,_that.isEdit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AccountInfo? accountInfo,  bool isEdit)  $default,) {final _that = this;
switch (_that) {
case _AccountInfoState():
return $default(_that.accountInfo,_that.isEdit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AccountInfo? accountInfo,  bool isEdit)?  $default,) {final _that = this;
switch (_that) {
case _AccountInfoState() when $default != null:
return $default(_that.accountInfo,_that.isEdit);case _:
  return null;

}
}

}

/// @nodoc


class _AccountInfoState extends AccountInfoState {
  const _AccountInfoState({this.accountInfo, this.isEdit = false}): super._();
  

@override final  AccountInfo? accountInfo;
@override@JsonKey() final  bool isEdit;

/// Create a copy of AccountInfoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountInfoStateCopyWith<_AccountInfoState> get copyWith => __$AccountInfoStateCopyWithImpl<_AccountInfoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountInfoState&&(identical(other.accountInfo, accountInfo) || other.accountInfo == accountInfo)&&(identical(other.isEdit, isEdit) || other.isEdit == isEdit));
}


@override
int get hashCode => Object.hash(runtimeType,accountInfo,isEdit);

@override
String toString() {
  return 'AccountInfoState(accountInfo: $accountInfo, isEdit: $isEdit)';
}


}

/// @nodoc
abstract mixin class _$AccountInfoStateCopyWith<$Res> implements $AccountInfoStateCopyWith<$Res> {
  factory _$AccountInfoStateCopyWith(_AccountInfoState value, $Res Function(_AccountInfoState) _then) = __$AccountInfoStateCopyWithImpl;
@override @useResult
$Res call({
 AccountInfo? accountInfo, bool isEdit
});




}
/// @nodoc
class __$AccountInfoStateCopyWithImpl<$Res>
    implements _$AccountInfoStateCopyWith<$Res> {
  __$AccountInfoStateCopyWithImpl(this._self, this._then);

  final _AccountInfoState _self;
  final $Res Function(_AccountInfoState) _then;

/// Create a copy of AccountInfoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountInfo = freezed,Object? isEdit = null,}) {
  return _then(_AccountInfoState(
accountInfo: freezed == accountInfo ? _self.accountInfo : accountInfo // ignore: cast_nullable_to_non_nullable
as AccountInfo?,isEdit: null == isEdit ? _self.isEdit : isEdit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
