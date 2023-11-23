// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Pointer<Void> handle
///  The handle to the dynamic library.
///
/// @description Checks that this property returns different handles for the
/// different dynamic libraries
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "../ffi_utils.dart";
import "../../../Utils/expect.dart";

void main() {
  DynamicLibrary dl1 = new DynamicLibrary.executable();
  final path = libPath(TEST_DYNAMIC_LIB);
  DynamicLibrary dl2 = new DynamicLibrary.open(path);
  Expect.notEquals(dl1.handle, dl2.handle);
  Expect.notEquals(dl1.handle.address, dl2.handle.address);
}
