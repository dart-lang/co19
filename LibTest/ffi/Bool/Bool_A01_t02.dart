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
  Pointer<Uint8> p2 = new Pointer<Uint8>.fromAddress(p1.address);
  try {
    p2.value = 0;
    Expect.isFalse(p1.value);
    p2.value = 1;
    Expect.isTrue(p1.value);
    p2.value = 2;
    Expect.isTrue(p1.value);
    p2.value = 127;
    Expect.isTrue(p1.value);
    p2.value = 128;
    Expect.isTrue(p1.value);
    p2.value = 255;
    Expect.isTrue(p1.value);
    p2.value = 256;
    Expect.isFalse(p1.value);
  } finally {
    calloc.free(p1);
  }
}
