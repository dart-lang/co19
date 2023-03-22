// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All field declarations in a Union subclass declaration must
/// either have type int or float and be annotated with a NativeType
/// representing the native type, or must be of type Pointer or subtype of
/// Struct or Union.
///
/// @description Checks that 'Union' subtype value depends on annotation
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

final class U1 extends Union {
  @Int64()
  external int x;
}

final class U2 extends Union {
  @Int16()
  external int x;
}

final class U3 extends Union {
  @Uint16()
  external int x;
}

void main() {
  Pointer<U1> u1 = calloc<U1>();
  try {
    u1.ref.x = 0x1111222233334444;
    Expect.equals(0x1111222233334444, u1.ref.x);

    Pointer<U2> u2 = new Pointer.fromAddress(u1.address);
    Expect.equals(0x4444, u2.ref.x);
    Expect.equals(0x3333, u2.elementAt(1).ref.x);
    Expect.equals(0x2222, u2.elementAt(2).ref.x);
    Expect.equals(0x1111, u2.elementAt(3).ref.x);

    Pointer<U3> u3 = new Pointer.fromAddress(u1.address);
    Expect.equals(0x4444, u3.ref.x);
    Expect.equals(0x3333, u3.elementAt(1).ref.x);
    Expect.equals(0x2222, u3.elementAt(2).ref.x);
    Expect.equals(0x1111, u3.elementAt(3).ref.x);

    u1.ref.x = 0xFFFFFFFFFFFFFFFF;
    Expect.equals(-1, u2.ref.x);
    Expect.equals(65535, u3.ref.x);
  } finally {
    calloc.free(u1);
  }
}
