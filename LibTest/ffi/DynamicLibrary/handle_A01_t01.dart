// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Pointer<Void> handle
///  The handle to the dynamic library.
///
/// @description Checks that this property returns the same handle to the same
/// dynamic library.
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "../../../Utils/expect.dart";

void main() {
  DynamicLibrary dl1 = new DynamicLibrary.executable();
  Expect.isNotNull(dl1.handle);
  DynamicLibrary dl2 = new DynamicLibrary.executable();
  Expect.equals(dl1.handle, dl2.handle);
  Expect.equals(dl1.handle.address, dl2.handle.address);
}
