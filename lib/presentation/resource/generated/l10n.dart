// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Trang chủ`
  String get home {
    return Intl.message('Trang chủ', name: 'home', desc: '', args: []);
  }

  /// `Thông tin`
  String get profile {
    return Intl.message('Thông tin', name: 'profile', desc: '', args: []);
  }

  /// `Thông báo`
  String get notification {
    return Intl.message('Thông báo', name: 'notification', desc: '', args: []);
  }

  /// `Xin chào`
  String get login_welcome {
    return Intl.message('Xin chào', name: 'login_welcome', desc: '', args: []);
  }

  /// `Email`
  String get login_email_label {
    return Intl.message('Email', name: 'login_email_label', desc: '', args: []);
  }

  /// `Mật khẩu`
  String get login_password_label {
    return Intl.message(
      'Mật khẩu',
      name: 'login_password_label',
      desc: '',
      args: [],
    );
  }

  /// `Quên mật khẩu?`
  String get login_forgot_password {
    return Intl.message(
      'Quên mật khẩu?',
      name: 'login_forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập`
  String get login_button {
    return Intl.message('Đăng nhập', name: 'login_button', desc: '', args: []);
  }

  /// `Tạo tài khoản mới`
  String get login_create_account {
    return Intl.message(
      'Tạo tài khoản mới',
      name: 'login_create_account',
      desc: '',
      args: [],
    );
  }

  /// `Email không hợp lệ`
  String get login_error_invalid_email {
    return Intl.message(
      'Email không hợp lệ',
      name: 'login_error_invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập email`
  String get login_error_empty_email {
    return Intl.message(
      'Vui lòng nhập email',
      name: 'login_error_empty_email',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập mật khẩu`
  String get login_error_empty_password {
    return Intl.message(
      'Vui lòng nhập mật khẩu',
      name: 'login_error_empty_password',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin đăng nhập không hợp lệ`
  String get login_error_invalid_credential {
    return Intl.message(
      'Thông tin đăng nhập không hợp lệ',
      name: 'login_error_invalid_credential',
      desc: '',
      args: [],
    );
  }

  /// `Tài khoản không tồn tại`
  String get login_error_user_not_found {
    return Intl.message(
      'Tài khoản không tồn tại',
      name: 'login_error_user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu không chính xác`
  String get login_error_wrong_password {
    return Intl.message(
      'Mật khẩu không chính xác',
      name: 'login_error_wrong_password',
      desc: '',
      args: [],
    );
  }

  /// `Tài khoản đã bị vô hiệu hóa`
  String get login_error_user_disabled {
    return Intl.message(
      'Tài khoản đã bị vô hiệu hóa',
      name: 'login_error_user_disabled',
      desc: '',
      args: [],
    );
  }

  /// `Bạn thao tác quá nhanh, vui lòng thử lại sau`
  String get login_error_too_many_requests {
    return Intl.message(
      'Bạn thao tác quá nhanh, vui lòng thử lại sau',
      name: 'login_error_too_many_requests',
      desc: '',
      args: [],
    );
  }

  /// `Có lỗi xảy ra. Vui lòng thử lại.`
  String get login_error_unknown {
    return Intl.message(
      'Có lỗi xảy ra. Vui lòng thử lại.',
      name: 'login_error_unknown',
      desc: '',
      args: [],
    );
  }

  /// `Email này đã được sử dụng.`
  String get exist_email {
    return Intl.message(
      'Email này đã được sử dụng.',
      name: 'exist_email',
      desc: '',
      args: [],
    );
  }

  /// `Email hoặc mật khẩu không chính xác.`
  String get invalid_credential {
    return Intl.message(
      'Email hoặc mật khẩu không chính xác.',
      name: 'invalid_credential',
      desc: '',
      args: [],
    );
  }

  /// `Đăng ký`
  String get sign_up_title {
    return Intl.message('Đăng ký', name: 'sign_up_title', desc: '', args: []);
  }

  /// `Tạo tài khoản`
  String get sign_up_button {
    return Intl.message(
      'Tạo tài khoản',
      name: 'sign_up_button',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận mật khẩu`
  String get sign_up_password_confirm_label {
    return Intl.message(
      'Xác nhận mật khẩu',
      name: 'sign_up_password_confirm_label',
      desc: '',
      args: [],
    );
  }

  /// `Nhập lại mật khẩu mới không khớp`
  String get password_does_not_match_please_try_again {
    return Intl.message(
      'Nhập lại mật khẩu mới không khớp',
      name: 'password_does_not_match_please_try_again',
      desc: '',
      args: [],
    );
  }

  /// `Quên mật khẩu`
  String get forgot_password_title {
    return Intl.message(
      'Quên mật khẩu',
      name: 'forgot_password_title',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập địa chỉ email liên kết với tài khoản của bạn để nhận liên kết đặt lại mật khẩu.`
  String get forgot_password_instruction {
    return Intl.message(
      'Vui lòng nhập địa chỉ email liên kết với tài khoản của bạn để nhận liên kết đặt lại mật khẩu.',
      name: 'forgot_password_instruction',
      desc: '',
      args: [],
    );
  }

  /// `Gửi email đặt lại mật khẩu`
  String get forgot_password_send_button {
    return Intl.message(
      'Gửi email đặt lại mật khẩu',
      name: 'forgot_password_send_button',
      desc: '',
      args: [],
    );
  }

  /// `Email đặt lại mật khẩu đã được gửi, vui lòng kiểm tra hộp thư của bạn.`
  String get forgot_password_success_message {
    return Intl.message(
      'Email đặt lại mật khẩu đã được gửi, vui lòng kiểm tra hộp thư của bạn.',
      name: 'forgot_password_success_message',
      desc: '',
      args: [],
    );
  }

  /// `Quay lại đăng nhập`
  String get forgot_password_back_to_login {
    return Intl.message(
      'Quay lại đăng nhập',
      name: 'forgot_password_back_to_login',
      desc: '',
      args: [],
    );
  }

  /// `Lưu ý: Nếu bạn đăng ký bằng Google hoặc Apple, mật khẩu không thể đặt lại tại đây.`
  String get forgot_password_social_note {
    return Intl.message(
      'Lưu ý: Nếu bạn đăng ký bằng Google hoặc Apple, mật khẩu không thể đặt lại tại đây.',
      name: 'forgot_password_social_note',
      desc: '',
      args: [],
    );
  }

  /// `Tôi đồng ý với điều khoản và chính sách`
  String get i_agree_policy {
    return Intl.message(
      'Tôi đồng ý với điều khoản và chính sách',
      name: 'i_agree_policy',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng đồng ý điều khoản và chính sách`
  String get please_agree_term_policy {
    return Intl.message(
      'Vui lòng đồng ý điều khoản và chính sách',
      name: 'please_agree_term_policy',
      desc: '',
      args: [],
    );
  }

  /// `Họ và tên`
  String get full_name {
    return Intl.message('Họ và tên', name: 'full_name', desc: '', args: []);
  }

  /// `Đăng ký thành công! Vui lòng kiểm tra email để xác thực tài khoản.`
  String get sign_up_success {
    return Intl.message(
      'Đăng ký thành công! Vui lòng kiểm tra email để xác thực tài khoản.',
      name: 'sign_up_success',
      desc: '',
      args: [],
    );
  }

  /// `Đăng xuất`
  String get sign_out {
    return Intl.message('Đăng xuất', name: 'sign_out', desc: '', args: []);
  }

  /// `Còn hàng`
  String get in_stock {
    return Intl.message('Còn hàng', name: 'in_stock', desc: '', args: []);
  }

  /// `Hết hàng`
  String get out_stock {
    return Intl.message('Hết hàng', name: 'out_stock', desc: '', args: []);
  }

  /// `Chi tiết sản phẩm`
  String get product_detail {
    return Intl.message(
      'Chi tiết sản phẩm',
      name: 'product_detail',
      desc: '',
      args: [],
    );
  }

  /// `Mô tả sản phẩm`
  String get description_product {
    return Intl.message(
      'Mô tả sản phẩm',
      name: 'description_product',
      desc: '',
      args: [],
    );
  }

  /// `Cập nhật lần cuối`
  String get update_at_last {
    return Intl.message(
      'Cập nhật lần cuối',
      name: 'update_at_last',
      desc: '',
      args: [],
    );
  }

  /// `Ngày nhập kho`
  String get create_at_repository {
    return Intl.message(
      'Ngày nhập kho',
      name: 'create_at_repository',
      desc: '',
      args: [],
    );
  }

  /// `Chưa có bản ghi nào`
  String get no_records_yet {
    return Intl.message(
      'Chưa có bản ghi nào',
      name: 'no_records_yet',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận xóa`
  String get confirm_remove {
    return Intl.message(
      'Xác nhận xóa',
      name: 'confirm_remove',
      desc: '',
      args: [],
    );
  }

  /// `Bạn có chắc chắn muốn xoá sản phẩm này?`
  String get info_confirm_remove {
    return Intl.message(
      'Bạn có chắc chắn muốn xoá sản phẩm này?',
      name: 'info_confirm_remove',
      desc: '',
      args: [],
    );
  }

  /// `Huỷ`
  String get cancel {
    return Intl.message('Huỷ', name: 'cancel', desc: '', args: []);
  }

  /// `Xác nhận`
  String get confirm {
    return Intl.message('Xác nhận', name: 'confirm', desc: '', args: []);
  }

  /// `Kết thúc`
  String get end {
    return Intl.message('Kết thúc', name: 'end', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'vi')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
