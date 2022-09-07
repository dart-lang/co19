// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Type inference and promotion flows through records in much the 
/// same way it does for instances of generic classes (which are covariant in 
/// Dart just like record fields are) and collection literals.
///
/// @description Checks horizontal inference for records.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=records

import "../../Utils/expect.dart";

typedef R1 = (int, {String s});
typedef R2 = (List<int>, {double n});

void f<T, U, V>(void Function(T, U) a, T b, U Function(V) c, V Function(U) d) {
  Expect.equals(R1, T);
  Expect.equals(R2, U);
  Expect.equals(typeOf<void Function(R1, R2)>(), a.runtimeType);
  Expect.equals(typeOf<R2 Function(Object? o)>(), c.runtimeType);
  Expect.equals(typeOf<bool Function(Object? o)>(), d.runtimeType);
}

main() {
  f((t, u) {
    t.$0.isOdd; // T == (int, {String s})
    t.s.substring(0);
    u.$0[0].isOdd; // U == (List<int>, {double n})
    u.n.isNaN;
  }, (42, s: "x"), (v) => (n: 3.14, [1, 2, 3]), (u) => true);
}
