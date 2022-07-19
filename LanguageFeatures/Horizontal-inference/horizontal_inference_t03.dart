// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Horizontal inference allows certain arguments of an invocation
/// (specifically function literals) to be type inferred in a context derived
/// from the type of other arguments.
///
/// @description Checks that type inferred from non-function types and return
/// types of the functions to function types
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

void f<T, U, V>(
    void Function(T, U, V) a, Map<T, U> b, Map<U, V> c, V Function(U) d) {
  Expect.equals(String, T);
  Expect.equals(int, U);
  Expect.equals(List<String>, V);
  Expect.equals(typeOf<void Function(String, int, List<String>)>(),
      a.runtimeType);
  Expect.equals(typeOf<List<String> Function(int)>(), d.runtimeType);
}

main() {
  // T = String, U = int, V = List<String>
  f((t, u, v) {
    t.substring(0);
    u.isOdd;
    v.first.substring(0);
  }, {
    "x": 42
  }, {
    42: ["x", "y"]
  }, (u) => ["Lily", "was", "here"]);
}
