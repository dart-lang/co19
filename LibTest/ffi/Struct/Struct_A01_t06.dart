// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All field declarations in a Struct subclass declaration must
/// either have type int or double and be annotated with a NativeType
/// representing the native type, or must be of type Pointer or subtype of Struct.
///
/// @description Checks that it is a compile error if any of the field in Struct
/// subclass is not 'int', 'double' or 'Pointer' or subtype of 'Struct'. Test
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

class S1 extends Struct {
  @Int8()
  external int i;

  external S s;

  external U u;
}

void main() {
  Pointer<S1> p = calloc<S1>();
  S1 s1 = p.ref;
  s1.u.x = 42;
  print(s1.u.x);
  s1.s.y = -42;
  print(s1.s.y);
}
