import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:uuid/uuid.dart';

class AppConnectionUtils {
  static final Map<String, Function(AppConnectionUtils)?> _onStatusChange = {};
  static StreamSubscription<List<ConnectivityResult>>? _subscription;
  static bool _isActive = false;
  static List<ConnectivityResult> _type = [ConnectivityResult.none];
  late final String _callbackId;

  AppConnectionUtils._(Function(AppConnectionUtils)? onStatusChange) {
    _callbackId = const Uuid().v4();
    _onStatusChange[_callbackId] = onStatusChange;
    _initialize();
  }

  factory AppConnectionUtils.noCallback() {
    return AppConnectionUtils._(null);
  }

  factory AppConnectionUtils.instance(
    Function(AppConnectionUtils)? onStatusChange,
  ) {
    return AppConnectionUtils._(onStatusChange);
  }

  bool get isActive => _isActive;


  List<ConnectivityResult> get type => _type;

  void dispose() {
    if (_onStatusChange.containsKey(_callbackId)) {
      _onStatusChange.remove(_callbackId);
    }

    if (_onStatusChange.isEmpty) {
      _subscription?.cancel();
      _subscription = null;
    }
  }

  Future<void> _initialize() async {
    if (_subscription != null) {
      return;
    }

    _subscription = Connectivity().onConnectivityChanged.listen(
      (result) {
        _type = result;
        _isActive = !_type.contains(ConnectivityResult.none);
        _onStatusChange.forEach((id, callback) {
          callback?.call(this);
        });
      },
    );
  }
}
