import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConnectivityProvider extends ChangeNotifier {
  final Connectivity _connectivity = Connectivity();
  bool get isOnline => _isOnline;
  bool _isOnline = true;

  Future<void> startMonitoring() async {
    await initConnectivity();
    _connectivity.onConnectivityChanged.listen(
      (
        result,
      ) async {
        if (result == ConnectivityResult.none) {
          _isOnline = false;
          notifyListeners();
        } else {
          await _updateConnectionStatus().then((isConnected) {
            _isOnline = isConnected;
            notifyListeners();
          });
        }
      },
    );
  }

  Future<void> initConnectivity() async {
    try {
      final status = await _connectivity.checkConnectivity();

      if (status == ConnectivityResult.none) {
        _isOnline = false;
        notifyListeners();
      } else {
        _isOnline = true;
        notifyListeners();
      }
    } on PlatformException catch (e) {
      log('PlatformException: $e');
    }
  }

  Future<bool> _updateConnectionStatus() async {
    var isConnected = true;
    try {
      final result = await InternetAddress.lookup('yandex.ru');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      }
    } on SocketException catch (_) {
      isConnected = false;
      //return false;
    }
    return isConnected;
  }
}
