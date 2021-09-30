// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Test equality of function and methods tearoffs.
/// https://github.com/dart-lang/language/issues/1712
///
/// @description Checks equality of instantiated top level generic functions
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

X topLevelFunction1<X>(X x) => x;
X topLevelFunction2<X>(X x) => x;

main() {
  <X>() {
    var f1_1 = topLevelFunction1<X>;
    var f1_2 = topLevelFunction1<X>;
    X Function(X) f1_3 = topLevelFunction1;
    var f2 = topLevelFunction2<X>;

    Expect.equals(f1_1, f1_2);
    Expect.equals(f1_1, f1_3);
    Expect.equals(f1_2, f1_3);
    Expect.notEquals(f1_1, f2);
  }<int>();
}
