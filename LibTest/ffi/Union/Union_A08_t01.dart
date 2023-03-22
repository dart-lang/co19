// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Field declarations in a Union subclass declaration are
/// automatically given a setter and getter implementation which accesses the
/// native union's field in memory.
///
/// @description Checks that fields in a Union subclass shares the same memory
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

final class U extends Union {
  @Int32()
  external int x;

  @Int16()
  external int y;
}

void main() {
  Pointer<U> p = calloc<U>();
  try {
    U u = p.ref;
    u.y = -42;
    u.x = 42;
    Expect.equals(42, u.x);
    Expect.equals(42, u.y);

    u.x = 1;
    u.y = 2;
    Expect.equals(2, u.x);
    Expect.equals(2, u.y);

    u.x = 65537;
    Expect.equals(65537, u.x);
    Expect.equals(1, u.y);

    u.x = 65538;
    Expect.equals(65538, u.x);
    Expect.equals(2, u.y);

    u.y = 2;
    Expect.equals(65538, u.x);
    Expect.equals(2, u.y);
  } finally {
    calloc.free(p);
  }
}
