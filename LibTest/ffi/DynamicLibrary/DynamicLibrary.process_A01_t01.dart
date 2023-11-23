// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion DynamicLibrary.process()
///  Creates a dynamic library holding all global symbols.
///
///  Any symbol in a library currently loaded with global visibility (including
///  the executable itself) may be resolved in this library.
///
/// @description Checks that this constructor creates a dynamic library holding
/// all global symbol
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "../../../Utils/expect.dart";

void main() {
  DynamicLibrary dl = new DynamicLibrary.process();
  Expect.isNotNull(dl);
  dl.lookup("Dart_Invoke");
  dl.lookup("printf");
}
