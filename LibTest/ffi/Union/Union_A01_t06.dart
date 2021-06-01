// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All field declarations in a Union subclass declaration must
/// either have type int or float and be annotated with a NativeType
/// representing the native type, or must be of type Pointer.
///
/// @description Checks that it is a compile error if any of the field in Struct
/// subclass is not 'int', 'double' or 'Pointer'. Test
/// field of 'Union' and 'Struct' subclass type
/// @author sgrekhov@unipro.ru
/// @issue 46194

import "dart:ffi";
import "package:ffi/ffi.dart";

class U extends Union {
  @Int32()
  external int x;
}

class S extends Struct {
  @Int32()
  external int y;
}

class U1 extends Union {
  @Int8()
  external int i;

  external S s;

  external U u;
}

void main() {
  Pointer<U1> p = calloc<U1>();
  U1 u1 = p.ref;
  u1.u.x = 42;
  print(u1.u.x);
  u1.s.y = -42;
  print(u1.s.y);
}
