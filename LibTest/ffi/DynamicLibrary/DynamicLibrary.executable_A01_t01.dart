// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion DynamicLibrary.executable()
///  Creates a dynamic library representing the running executable.
///
/// @description Checks that this constructor creates a dynamic library
/// representing the running executable
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "../../../Utils/expect.dart";

void main() {
  DynamicLibrary dl = new DynamicLibrary.executable();
  Expect.isNotNull(dl);
  dl.lookup("Dart_Invoke");
}
