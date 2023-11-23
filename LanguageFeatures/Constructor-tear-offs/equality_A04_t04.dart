// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Test equality of function and methods tearoffs.
/// https://github.com/dart-lang/language/issues/1712
///
/// @description Checks equality of instantiated generic static methods tearoffs
/// @author sgrekhov@unipro.ru
/// @issue 47329

import "../../Utils/expect.dart";

class C {
  static X foo1<X>(X x) => x;
  static X foo2<X>(X x) => x;
}

main() {
  const c1 = C.foo1<int>;
  const int Function(int) c2 = C.foo1;
  const c3 = C.foo2<int>;
  var v1 = C.foo1<int>;
  int Function(int) v2 = C.foo1;
  var v3 = C.foo2<int>;

  const CheckIdentical(c1, c2);
  Expect.identical(v1, c1);
  Expect.notEquals(c2, c3);
  Expect.identical(v1, v2);
  Expect.notEquals(v2, v3);
}
