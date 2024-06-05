import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

extension Something<MODEL> on AsyncValue<MODEL> {
  Widget displayWidget(Widget Function(MODEL data) child) {
    return when(
      data: (data) {
        return child(data);
      },
      loading: () {
        return const CircularProgressIndicator();
      },
      error: (error, stackTrace) {
        if (error is SocketException) {
          return Text('Network error: ${error.message}');
        } else if (error is TimeoutException) {
          return Text('Timeout error: ${error.message}');
        } else if (error is FormatException) {
          return Text('Format error: ${error.message}');
        } else {
          return Text('Unknown error: $error');
        }
      },
    );
  }
}