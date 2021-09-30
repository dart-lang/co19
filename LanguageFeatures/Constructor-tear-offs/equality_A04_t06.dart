// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Test equality of function and methods tearoffs.
/// https://github.com/dart-lang/language/issues/1712
///
/// @description Checks equality of instantiated generic static methods tearoffs
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class C {
  static X foo1<X>(X x) => x;
  static X foo2<X>(X x) => x;
}

typedef IntAlias = int;

main() {
  const c1 = C.foo1<int>;
  const c2 = C.foo1<IntAlias>;
  const c3 = C.foo2<IntAlias>;
  var v1 = C.foo1<IntAlias>;
  var v2 = C.foo1<int>;
  var v3 = C.foo2<int>;

  const CheckIdentical(c1, c2);
  Expect.notEquals(c3, c1);
  Expect.equals(c1, v1);
  Expect.identical(v1, v2);
  Expect.identical(c3, v3);
  Expect.notEquals(v1, v3);
}
