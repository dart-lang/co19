// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Test equality of function and methods tearoffs.
/// https://github.com/dart-lang/language/issues/1712
///
/// @description Checks equality of non-generic extension methods tearoffs
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class C {
}

extension on C {
  int foo1() => 42;
  int foo2() => 43;
}

main() {
  C c = new C();
  // We don't check equality of extension methods tearoffs. It is not specified
  // and implementation specific. So, these methods can be equal or unequal,
  // both is allowed. Simply check that these methods can be torn off.
  var v1 = c.foo1;
  var v2 = c.foo2;
  Expect.equals(42, v1());
  Expect.equals(43, v2());
}
