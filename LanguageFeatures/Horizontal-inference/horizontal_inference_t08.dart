// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Horizontal inference allows certain arguments of an invocation
/// (specifically function literals) to be type inferred in a context derived
/// from the type of other arguments.
///
/// @description Checks the case when type is inferred from return type of a
/// functions and these functions  return different types
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

class C1 {
  void c1() {}
}
class C2 extends C1 {}
class C3 extends C1 {}
typedef C1Nullable = C1?;

void f1<T>(void Function(T) a, T Function() b, T Function() c, Type t) {
  Expect.equals(t, T);
  Expect.equals(typeOf<void Function(T)>(), a.runtimeType);
}

main() {
  f1((t) { // T == C1
    t.c1();
  }, () => C3(), () => C2(), C1);
  f1((t) { // T == C1?
    t?.c1();
  }, () => null, () => C1(), C1Nullable);
}
