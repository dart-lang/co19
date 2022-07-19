// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Horizontal inference allows certain arguments of an invocation
/// (specifically function literals) to be type inferred in a context derived
/// from the type of other arguments.
///
/// @description Checks horizontal inference when type bounds specified
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

class C1 {}
class C2 extends C1 {}
class C3 extends C2 {
  void c3() {}
}

void f1<T extends C1>(void Function(T) a, T b) {
  Expect.isTrue(a is void Function(C3));
  Expect.isFalse(a is void Function(C1));
  Expect.equals(T, C3);
}

void f2<T extends C2>(T Function() a, void Function(T) b) {
  Expect.isTrue(a is C3 Function());
  Expect.isTrue(b is void Function(C3));
  Expect.isFalse(b is void Function(C2));
  Expect.equals(T, C3);
}

main() {
  f1((v) => v.c3(), C3());
  f2(() => C3(), (x) => x.c3());
}
