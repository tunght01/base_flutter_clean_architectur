// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppState {

 RemoteMessage? get remoteMessage; bool get appInitiated; bool get isLoggedIn; bool get savedAccount; bool get isDarkTheme; bool get isGoToNotify; LanguageCode get languageCode; List<ConnectivityResult> get connectivityType;
/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppStateCopyWith<AppState> get copyWith => _$AppStateCopyWithImpl<AppState>(this as AppState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppState&&(identical(other.remoteMessage, remoteMessage) || other.remoteMessage == remoteMessage)&&(identical(other.appInitiated, appInitiated) || other.appInitiated == appInitiated)&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn)&&(identical(other.savedAccount, savedAccount) || other.savedAccount == savedAccount)&&(identical(other.isDarkTheme, isDarkTheme) || other.isDarkTheme == isDarkTheme)&&(identical(other.isGoToNotify, isGoToNotify) || other.isGoToNotify == isGoToNotify)&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode)&&const DeepCollectionEquality().equals(other.connectivityType, connectivityType));
}


@override
int get hashCode => Object.hash(runtimeType,remoteMessage,appInitiated,isLoggedIn,savedAccount,isDarkTheme,isGoToNotify,languageCode,const DeepCollectionEquality().hash(connectivityType));

@override
String toString() {
  return 'AppState(remoteMessage: $remoteMessage, appInitiated: $appInitiated, isLoggedIn: $isLoggedIn, savedAccount: $savedAccount, isDarkTheme: $isDarkTheme, isGoToNotify: $isGoToNotify, languageCode: $languageCode, connectivityType: $connectivityType)';
}


}

/// @nodoc
abstract mixin class $AppStateCopyWith<$Res>  {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) _then) = _$AppStateCopyWithImpl;
@useResult
$Res call({
 RemoteMessage? remoteMessage, bool appInitiated, bool isLoggedIn, bool savedAccount, bool isDarkTheme, bool isGoToNotify, LanguageCode languageCode, List<ConnectivityResult> connectivityType
});




}
/// @nodoc
class _$AppStateCopyWithImpl<$Res>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._self, this._then);

  final AppState _self;
  final $Res Function(AppState) _then;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? remoteMessage = freezed,Object? appInitiated = null,Object? isLoggedIn = null,Object? savedAccount = null,Object? isDarkTheme = null,Object? isGoToNotify = null,Object? languageCode = null,Object? connectivityType = null,}) {
  return _then(_self.copyWith(
remoteMessage: freezed == remoteMessage ? _self.remoteMessage : remoteMessage // ignore: cast_nullable_to_non_nullable
as RemoteMessage?,appInitiated: null == appInitiated ? _self.appInitiated : appInitiated // ignore: cast_nullable_to_non_nullable
as bool,isLoggedIn: null == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool,savedAccount: null == savedAccount ? _self.savedAccount : savedAccount // ignore: cast_nullable_to_non_nullable
as bool,isDarkTheme: null == isDarkTheme ? _self.isDarkTheme : isDarkTheme // ignore: cast_nullable_to_non_nullable
as bool,isGoToNotify: null == isGoToNotify ? _self.isGoToNotify : isGoToNotify // ignore: cast_nullable_to_non_nullable
as bool,languageCode: null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as LanguageCode,connectivityType: null == connectivityType ? _self.connectivityType : connectivityType // ignore: cast_nullable_to_non_nullable
as List<ConnectivityResult>,
  ));
}

}


/// Adds pattern-matching-related methods to [AppState].
extension AppStatePatterns on AppState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppState value)  $default,){
final _that = this;
switch (_that) {
case _AppState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppState value)?  $default,){
final _that = this;
switch (_that) {
case _AppState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RemoteMessage? remoteMessage,  bool appInitiated,  bool isLoggedIn,  bool savedAccount,  bool isDarkTheme,  bool isGoToNotify,  LanguageCode languageCode,  List<ConnectivityResult> connectivityType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppState() when $default != null:
return $default(_that.remoteMessage,_that.appInitiated,_that.isLoggedIn,_that.savedAccount,_that.isDarkTheme,_that.isGoToNotify,_that.languageCode,_that.connectivityType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RemoteMessage? remoteMessage,  bool appInitiated,  bool isLoggedIn,  bool savedAccount,  bool isDarkTheme,  bool isGoToNotify,  LanguageCode languageCode,  List<ConnectivityResult> connectivityType)  $default,) {final _that = this;
switch (_that) {
case _AppState():
return $default(_that.remoteMessage,_that.appInitiated,_that.isLoggedIn,_that.savedAccount,_that.isDarkTheme,_that.isGoToNotify,_that.languageCode,_that.connectivityType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RemoteMessage? remoteMessage,  bool appInitiated,  bool isLoggedIn,  bool savedAccount,  bool isDarkTheme,  bool isGoToNotify,  LanguageCode languageCode,  List<ConnectivityResult> connectivityType)?  $default,) {final _that = this;
switch (_that) {
case _AppState() when $default != null:
return $default(_that.remoteMessage,_that.appInitiated,_that.isLoggedIn,_that.savedAccount,_that.isDarkTheme,_that.isGoToNotify,_that.languageCode,_that.connectivityType);case _:
  return null;

}
}

}

/// @nodoc


class _AppState extends AppState {
  const _AppState({this.remoteMessage, this.appInitiated = false, this.isLoggedIn = false, this.savedAccount = false, this.isDarkTheme = false, this.isGoToNotify = false, this.languageCode = LanguageCode.vi, final  List<ConnectivityResult> connectivityType = const []}): _connectivityType = connectivityType,super._();
  

@override final  RemoteMessage? remoteMessage;
@override@JsonKey() final  bool appInitiated;
@override@JsonKey() final  bool isLoggedIn;
@override@JsonKey() final  bool savedAccount;
@override@JsonKey() final  bool isDarkTheme;
@override@JsonKey() final  bool isGoToNotify;
@override@JsonKey() final  LanguageCode languageCode;
 final  List<ConnectivityResult> _connectivityType;
@override@JsonKey() List<ConnectivityResult> get connectivityType {
  if (_connectivityType is EqualUnmodifiableListView) return _connectivityType;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_connectivityType);
}


/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppStateCopyWith<_AppState> get copyWith => __$AppStateCopyWithImpl<_AppState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppState&&(identical(other.remoteMessage, remoteMessage) || other.remoteMessage == remoteMessage)&&(identical(other.appInitiated, appInitiated) || other.appInitiated == appInitiated)&&(identical(other.isLoggedIn, isLoggedIn) || other.isLoggedIn == isLoggedIn)&&(identical(other.savedAccount, savedAccount) || other.savedAccount == savedAccount)&&(identical(other.isDarkTheme, isDarkTheme) || other.isDarkTheme == isDarkTheme)&&(identical(other.isGoToNotify, isGoToNotify) || other.isGoToNotify == isGoToNotify)&&(identical(other.languageCode, languageCode) || other.languageCode == languageCode)&&const DeepCollectionEquality().equals(other._connectivityType, _connectivityType));
}


@override
int get hashCode => Object.hash(runtimeType,remoteMessage,appInitiated,isLoggedIn,savedAccount,isDarkTheme,isGoToNotify,languageCode,const DeepCollectionEquality().hash(_connectivityType));

@override
String toString() {
  return 'AppState(remoteMessage: $remoteMessage, appInitiated: $appInitiated, isLoggedIn: $isLoggedIn, savedAccount: $savedAccount, isDarkTheme: $isDarkTheme, isGoToNotify: $isGoToNotify, languageCode: $languageCode, connectivityType: $connectivityType)';
}


}

/// @nodoc
abstract mixin class _$AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) _then) = __$AppStateCopyWithImpl;
@override @useResult
$Res call({
 RemoteMessage? remoteMessage, bool appInitiated, bool isLoggedIn, bool savedAccount, bool isDarkTheme, bool isGoToNotify, LanguageCode languageCode, List<ConnectivityResult> connectivityType
});




}
/// @nodoc
class __$AppStateCopyWithImpl<$Res>
    implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(this._self, this._then);

  final _AppState _self;
  final $Res Function(_AppState) _then;

/// Create a copy of AppState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? remoteMessage = freezed,Object? appInitiated = null,Object? isLoggedIn = null,Object? savedAccount = null,Object? isDarkTheme = null,Object? isGoToNotify = null,Object? languageCode = null,Object? connectivityType = null,}) {
  return _then(_AppState(
remoteMessage: freezed == remoteMessage ? _self.remoteMessage : remoteMessage // ignore: cast_nullable_to_non_nullable
as RemoteMessage?,appInitiated: null == appInitiated ? _self.appInitiated : appInitiated // ignore: cast_nullable_to_non_nullable
as bool,isLoggedIn: null == isLoggedIn ? _self.isLoggedIn : isLoggedIn // ignore: cast_nullable_to_non_nullable
as bool,savedAccount: null == savedAccount ? _self.savedAccount : savedAccount // ignore: cast_nullable_to_non_nullable
as bool,isDarkTheme: null == isDarkTheme ? _self.isDarkTheme : isDarkTheme // ignore: cast_nullable_to_non_nullable
as bool,isGoToNotify: null == isGoToNotify ? _self.isGoToNotify : isGoToNotify // ignore: cast_nullable_to_non_nullable
as bool,languageCode: null == languageCode ? _self.languageCode : languageCode // ignore: cast_nullable_to_non_nullable
as LanguageCode,connectivityType: null == connectivityType ? _self._connectivityType : connectivityType // ignore: cast_nullable_to_non_nullable
as List<ConnectivityResult>,
  ));
}


}

// dart format on
