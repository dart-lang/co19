// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Horizontal inference allows certain arguments of an invocation
/// (specifically function literals) to be type inferred in a context derived
/// from the type of other arguments.
///
/// @description Checks horizontal inference from empty lists and maps
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

void f1<T>(void Function(T) a, List<T> b) {
  Expect.equals(dynamic, T);
}
void f2<T, U>(void Function(T, U) a, Map<T, U> b) {
  Expect.equals(dynamic, T);
  Expect.equals(dynamic, U);
}

main() {
  f1((t) {
    t.anyMethod(); // t is `dynamic here`
    t.anyPropertyWithAnyName;
  }, []);
  f2((t, u) {
    t.anyMethod(); // t is `dynamic here`
    t.anyPropertyWithAnyName;
    u.anyMethod2(); // u is `dynamic here`
    u.anyPropertyWithAnyName2;
  }, {});
}
