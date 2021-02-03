  /*
 * Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Utils for co19 ffi tests
 * @author sgrekhov@unipro.ru
 */
import 'dart:ffi' as ffi;
import 'dart:io' show Platform;

String libPath(String libName, {String path = ""}) {
  if (Platform.isLinux || Platform.isAndroid || Platform.isFuchsia)
    return path + "lib" + libName + ".so";
  if (Platform.isMacOS) return path + "lib" + libName + ".dylib";
  if (Platform.isWindows) return path + libName + ".dll";
  throw Exception("Platform not implemented");
}

ffi.DynamicLibrary openLibrary(String name, {String path = ""}) {
  String fullPath = libPath(name, path: path);
  return ffi.DynamicLibrary.open(fullPath);
}
