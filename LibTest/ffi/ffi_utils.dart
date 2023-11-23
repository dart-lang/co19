// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @description Utils for co19 ffi tests
/// @author sgrekhov@unipro.ru

import 'dart:ffi';
import 'dart:io' show Platform;

const TEST_DYNAMIC_LIB = "ffi_test_dynamic_library";
const TEST_FUNCTIONS_LIB = "ffi_test_functions";

String libPath(String libName, {String path = ""}) {
  if (Platform.isLinux || Platform.isAndroid || Platform.isFuchsia)
    return path + "lib" + libName + ".so";
  if (Platform.isMacOS) return path + "lib" + libName + ".dylib";
  if (Platform.isWindows) return path + libName + ".dll";
  throw Exception("Platform not implemented");
}

String libPathAbsolute(String libName, {String path = ""}) {
  String p = libPath(libName, path: path);
  String exPath = Platform.resolvedExecutable;
  String out = Platform.pathSeparator + "out" + Platform.pathSeparator;
  int ind = exPath.indexOf(out);
  if (ind < 0) {
    throw Exception("Unable to resolve absolute path to the library '${libName}'");
  }
  int ind2 = exPath.indexOf(Platform.pathSeparator, ind + out.length);
  return exPath.substring(0, ind2) + Platform.pathSeparator + p;
}
