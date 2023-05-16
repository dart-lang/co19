// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All field declarations in a Struct subclass declaration must
/// either have type int or double and be annotated with a NativeType
/// representing the native type, or must be of type Pointer or subtype of
/// Struct or Union.
///
/// @description Checks that it is not an error if all of the field in Struct
/// subclass are 'int', 'double', 'Pointer' or subtype of 'Struct' or 'Union'
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

final class S1 extends Struct {
  @Int8()
  external int i;

  @Float()
  external double d;

  external Pointer<Int16> p;

  external S s;

  external U u;
}

void main() {
  Pointer<S1> p = calloc<S1>();
  try {
    S1 s1 = p.ref;
    s1.u.x = 42;
    Expect.equals(42, s1.u.x);
    s1.s.y = -42;
    Expect.equals(-42, s1.s.y);
    s1.i = 1;
    Expect.equals(1, s1.i);
    s1.d = 3.14;
    Expect.approxEquals(3.14, s1.d);
    s1.p = calloc<Int16>();
    try {
      s1.p.value = 13;
      Expect.equals(13, s1.p.value);
    } finally {
      calloc.free(s1.p);
    }
  } finally {
    calloc.free(p);
  }
}
