// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Represents a native bool in C.
///
/// Bool is not constructible in the Dart code and serves purely as marker in
/// type signatures.
///
/// @description Checks that this type represents a native bool in C.
/// @author sgrekhov22@gmail.com

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

void main() {
  Pointer<Bool> p1 = calloc<Bool>();
  try {
    Expect.isFalse(p1.value);
    p1.value = true;
    Expect.isTrue(p1.value);
    p1.value = false;
    Expect.isFalse(p1.value);
  } finally {
    calloc.free(p1);
  }
}
