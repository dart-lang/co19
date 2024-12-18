// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Library for work with Dart garbage collector tools.
/// @author sgrekhov@unipro.ru
library gc_utils_lib;

import "dart:io";
import "dart:ffi";

void triggerGc() {
  String _platformPath(String name, {String? path}) {
    if (path == null) path = "";
    if (Platform.isLinux || Platform.isAndroid || Platform.isFuchsia)
      return path + "lib" + name + ".so";
    if (Platform.isMacOS) return path + "lib" + name + ".dylib";
    if (Platform.isWindows) return path + name + ".dll";
    throw Exception("Platform not implemented");
  }

  DynamicLibrary dlOpenPlatformSpecific(String name, {String? path}) {
    String fullPath = _platformPath(name, path: path);
    return DynamicLibrary.open(fullPath);
  }

  final ffiTestFunctions = dlOpenPlatformSpecific("ffi_test_functions");

  void Function() _triggerGC = ffiTestFunctions
      .lookupFunction<Void Function(), void Function()>("TriggerGC");
  _triggerGC();
}

Future<void> triggerGcWithDelay(
    {Duration delay = const Duration(milliseconds: 3), int repeat = 1}) async {
  for (int i = 0; i < repeat; i++) {
    triggerGc();
    await Future.delayed(delay);
  }
}
