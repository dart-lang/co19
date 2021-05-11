// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// bool operator == (Object other)
///  override
///  Dynamic libraries are equal if they load the same library.
///
/// @description Checks that calling this function multiple times, even in
/// different isolates, returns objects which are equal but not identical
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "../ffi_utils.dart";
import "../../../Utils/expect.dart";

void main() {
  final path = libPath(TEST_DYNAMIC_LIB);
  DynamicLibrary dl1 = new DynamicLibrary.open(path);
  DynamicLibrary dl2 = new DynamicLibrary.open(path);
  DynamicLibrary dl3 = new DynamicLibrary.executable();
  Expect.isTrue(dl1 == dl2);
  Expect.isFalse(dl1 == dl3);
}
