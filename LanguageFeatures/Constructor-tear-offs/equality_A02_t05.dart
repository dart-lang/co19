// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Test equality of function and methods tearoffs.
/// https://github.com/dart-lang/language/issues/1712
///
/// @description Checks equality of instantiated top level generic functions
/// @author sgrekhov@unipro.ru
/// @issue 47329

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

X topLevelFunction1<X>(X x) => x;

const cTlf1 = topLevelFunction1<int>;
const int Function(int) cTlf1_2 = topLevelFunction1;
var vTlf1 = topLevelFunction1<int>;
int Function(int) vTlf1_2 = topLevelFunction1;

main() {
  const cTlf1_3 = topLevelFunction1<int>;
  const int Function(int) cTlf1_4 = topLevelFunction1;
  var vTlf1_3 = topLevelFunction1<int>;
  int Function(int) vTlf1_4 = topLevelFunction1;

  const CheckIdentical(cTlf1, cTlf1_2);
  Expect.equals(cTlf1, cTlf1_2);
  Expect.equals(cTlf1_3, cTlf1_4);
  Expect.equals(cTlf1, cTlf1_4);

  Expect.equals(vTlf1, vTlf1_2);
  Expect.equals(vTlf1_3, vTlf1_4);
  Expect.equals(vTlf1, vTlf1_4);
  Expect.identical(vTlf1, vTlf1_2);
  Expect.identical(vTlf1_3, vTlf1_4);
  Expect.identical(vTlf1, vTlf1_4);

  Expect.identical(cTlf1, vTlf1);
  Expect.identical(cTlf1, vTlf1_3);
}
