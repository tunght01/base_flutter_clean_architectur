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
