// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Test equality of function and methods tearoffs.
/// https://github.com/dart-lang/language/issues/1712
///
/// @description Checks equality of instantiated generic static methods tearoffs
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class C {
  static X foo1<X>(X x) => x;
}

main() {
  const c1 = C.foo1<int>;
  const c2 = C.foo1<num>;
  var v1 = C.foo1<int>;
  var v2 = C.foo1<num>;

  const CheckNotIdentical(c1, c2);
  Expect.identical(c1, v1);
  Expect.notEquals(v1, v2);
}
