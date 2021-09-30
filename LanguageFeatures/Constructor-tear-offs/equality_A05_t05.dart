// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Test equality of function and methods tearoffs.
/// https://github.com/dart-lang/language/issues/1712
///
/// @description Checks equality of instantiated generic instance methods
/// tearoffs
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class C {
  X foo1<X>(X x) => x;
  X foo2<X>(X x) => x;
}

main() {
  C c = new C();
  var v1 = c.foo1<int>;
  int Function(int) v2 = c.foo1;
  var v3 = c.foo2<int>;

  Expect.equals(v1, v2);
  Expect.notEquals(v1, v3);
}
