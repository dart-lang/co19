// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Test equality of function and methods tearoffs.
/// https://github.com/dart-lang/language/issues/1712
///
/// @description Checks equality of generic extension methods tearoffs
/// @author sgrekhov@unipro.ru
/// @issue 47329

import "../../Utils/expect.dart";

class C {
}

extension EC on C {
  static X foo1<X>(X x) => x;
  static X foo2<X>(X x) => x;
}

main() {
  const c1_1 = EC.foo1<int>;
  const int Function(int) c1_2 = EC.foo1;
  const c2 = EC.foo2<int>;
  var v1_1 = EC.foo1<int>;
  int Function(int) v1_2 = EC.foo1;
  var v2 = EC.foo2<int>;

  const CheckIdentical(c1_1, c1_2);
  const CheckNotIdentical(c1_1, c2);
  Expect.notEquals(c1_2, c2);
  Expect.identical(v1_1, v1_2);
  Expect.equals(c1_1, v1_1);
  Expect.equals(c1_1, v1_2);
  Expect.notEquals(v1_2, v2);
}
