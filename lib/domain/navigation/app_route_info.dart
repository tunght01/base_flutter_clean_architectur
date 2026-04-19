import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_route_info.freezed.dart';

/// page
@freezed
abstract class AppRouteInfo with _$AppRouteInfo {
  const AppRouteInfo._();
  const factory AppRouteInfo.openAccount() = _OpenAccount;
  const factory AppRouteInfo.forgotPassword() = _ForgotPassword;
  const factory AppRouteInfo.login() = _Login;
  const factory AppRouteInfo.main() = _Main;
  const factory AppRouteInfo.productDetail({required String id}) =
      _ProductDetail;
  const factory AppRouteInfo.interfaceApp() = _InterfaceApp;
}
