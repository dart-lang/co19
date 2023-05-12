// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All field declarations in a Union subclass declaration must
/// either have type int or float and be annotated with a NativeType
/// representing the native type, or must be of type Pointer or subtype of
/// Struct or Union.
///
/// @description Checks that it is not an error if all of the field in Union
/// subclass are 'int', 'double', 'Pointer' or subtype of Struct or Union
/// @author sgrekhov@unipro.ru
/// @issue 46194

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../../Utils/expect.dart";

final class U extends Union {
  @Int32()
  external int x;
}

final class S extends Struct {
  @Int32()
  external int y;
}

final class U1 extends Union {
  @Int8()
  external int i;

  @Float()
  external double d;

  external Pointer<Int16> p;

  external S s;

  external U u;
}

void main() {
  Pointer<U1> p = calloc<U1>();
  try {
    U1 u1 = p.ref;
    u1.u.x = 42;
    Expect.equals(42, u1.u.x);
    u1.s.y = -42;
    Expect.equals(-42, u1.s.y);
    u1.i = 1;
    Expect.equals(1, u1.i);
    u1.d = 3.14;
    Expect.approxEquals(3.14, u1.d);
    u1.p = calloc<Int16>();
    u1.p.value = 13;
    Expect.equals(13, u1.p.value);
  } finally {
    calloc.free(p);
  }
}
