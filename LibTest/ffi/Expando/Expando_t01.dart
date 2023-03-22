// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Does not work on numbers, strings, booleans, null,
/// dart:ffi pointers, dart:ffi structs, or dart:ffi unions.
/// @description Checks that [Expando] does not work on dart:ffi pointers,
/// dart:ffi structs, or dart:ffi unions
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=class-modifiers

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../Utils/expect.dart';

final class S extends Struct {
  @Int16()
  external int x;
}

final class U extends Union {
  @Int16()
  external int x;
}

main() {
  Expando<int> exp = Expando("C");
  Pointer<Int8> p1 = calloc<Int8>();
  Pointer<S> p2 = calloc<S>();
  Pointer<U> p3 = calloc<U>();
  try {
    Expect.throws(() {exp[p1] = 42;});
    S s = p2.ref;
    Expect.throws(() {exp[s] = 42;});
    U u = p3.ref;
    Expect.throws(() {exp[u] = 42;});
  } finally {
    calloc.free(p1);
    calloc.free(p2);
    calloc.free(p3);
  }
}
