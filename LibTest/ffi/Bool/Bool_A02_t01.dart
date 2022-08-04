// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Represents a native bool in C.
///
/// [Bool] is not constructible in the Dart code and serves purely as marker in
/// type signatures.
///
/// @description Checks that this type represents a native bool in C.
/// @author sgrekhov22@gmail.com

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<Bool> p1 = calloc<Bool>(2);
  try {
    Expect.equals(1, p1.elementAt(1).address - p1.address);
    Expect.equals(1, sizeOf<Bool>());
  } finally {
    calloc.free(p1);
  }
}
