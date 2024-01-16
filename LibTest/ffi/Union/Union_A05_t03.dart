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
  @Int8()
  external int x;
}

final class U3 extends Union {
  @Uint8()
  external int x;
}

void main() {
  Pointer<U1> u1 = calloc<U1>();
  try {
    u1.ref.x = 0x1122334455667712;
    Expect.equals(0x1122334455667712, u1.ref.x);

    Pointer<U2> u2 = new Pointer.fromAddress(u1.address);
    Expect.equals(0x12, u2.ref.x);
    Expect.equals(0x77, (u2 + 1).ref.x);
    Expect.equals(0x66, (u2 + 2).ref.x);
    Expect.equals(0x55, (u2 + 3).ref.x);
    Expect.equals(0x44, (u2 + 4).ref.x);
    Expect.equals(0x33, (u2 + 5).ref.x);
    Expect.equals(0x22, (u2 + 6).ref.x);
    Expect.equals(0x11, (u2 + 7).ref.x);

    Pointer<U3> u3 = new Pointer.fromAddress(u1.address);
    Expect.equals(0x12, u3.ref.x);
    Expect.equals(0x77, (u3 + 1).ref.x);
    Expect.equals(0x66, (u3 + 2).ref.x);
    Expect.equals(0x55, (u3 + 3).ref.x);
    Expect.equals(0x44, (u3 + 4).ref.x);
    Expect.equals(0x33, (u3 + 5).ref.x);
    Expect.equals(0x22, (u3 + 6).ref.x);
    Expect.equals(0x11, (u3 + 7).ref.x);

    u1.ref.x = 0xFFFFFFFFFFFFFFFF;
    Expect.equals(-1, u2.ref.x);
    Expect.equals(255, u3.ref.x);
  } finally {
    calloc.free(u1);
  }
}
