// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Horizontal inference allows certain arguments of an invocation
/// (specifically function literals) to be type inferred in a context derived
/// from the type of other arguments.
///
/// @description Checks that type inferred from non-function types and return
/// types of the functions to function parameters types
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

typedef Str = String;
typedef Int = int;
typedef Boolean = bool;

void f<T, U, V>(void Function(T, U) a, T b, U Function(V) c, V Function(U) d) {
  Expect.equals(String, T);
  Expect.equals(int, U);
  Expect.equals(typeOf<void Function(String, int)>(), a.runtimeType);
  Expect.equals(typeOf<int Function(Object? o)>(), c.runtimeType);
  Expect.equals(typeOf<bool Function(Object? o)>(), d.runtimeType);
}

main() {
  f((t, u) {
    t.indexOf("x"); // T == String
    u.isOdd; // U == int
  }, "x", (v) => 42, (u) => true);

  Str s = "Lily was here";
  Int i = 0;
  Boolean b = true;
  f((t, u) {
    t.substring(0); // T == String
    u.isEven; // U == int
  }, s, (v) => i, (u) => b);
}
