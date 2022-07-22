// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Horizontal inference allows certain arguments of an invocation
/// (specifically function literals) to be type inferred in a context derived
/// from the type of other arguments.
///
/// @description Checks the case when type is inferred from return type of a
/// function and this function may return different types
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

class C1 {
  void c1() {}
}
class C2 extends C1 {
  void c2() {}
}

void f1<T, U, V>(void Function(T, U) a, T Function(U) b, U Function(V) c) {
  Expect.equals(C1, T);
  Expect.equals(Object, U);
  Expect.equals(typeOf<Object?>(), V);
  Expect.equals(typeOf<void Function(C1, Object)>(), a.runtimeType);
  Expect.equals(typeOf<C1 Function(Object)>(), b.runtimeType);
  Expect.equals(typeOf<Object Function(Object?)>(), c.runtimeType);
}

main() {
  f1((t, u) {
    t.c1();
  }, (u) {
    return 1 > 2 ? C2() : C1();
  }, (v) {
    if (2 < 1) {
      return C2();
    }
    return 42;
  });
}
