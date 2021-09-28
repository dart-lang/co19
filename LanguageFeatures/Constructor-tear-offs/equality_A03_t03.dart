// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Test equality of function and methods tearoffs.
/// https://github.com/dart-lang/language/issues/1712
///
/// @description Checks equality of instantiated local generic functions
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

var g1;
var g2;

main() {
  X localFunction1<X>(X x) => x;
  X localFunction2<X>(X x) => x;

  var f1_1 = localFunction1<int>;
  var f1_2 = localFunction1<int>;
  var f2 = localFunction2<int>;

  Expect.notEquals(f1_1, f1_2);
  Expect.notEquals(f2, f1_1);
  Expect.notEquals(f2, f1_2);

  g1 = localFunction1<int>;
  g2 = localFunction1<int>;

  Expect.notEquals(g1, g2);
  Expect.notEquals(g1, f1_1);
  Expect.notEquals(g2, f1_2);
}
