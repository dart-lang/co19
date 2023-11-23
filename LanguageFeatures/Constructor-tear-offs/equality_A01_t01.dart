// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Test equality of function and methods tearoffs.
///
/// @description Checks equality of top level non-generic functions
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

int topLevelFunction1() => 42;
int topLevelFunction2() => 42;

const cTlf1 = topLevelFunction1;
const cTlf1_2 = topLevelFunction1;
var vTlf1 = topLevelFunction1;
var vTlf1_2 = topLevelFunction1;

const cTlf2 = topLevelFunction2;
var vTlf2 = topLevelFunction2;

main() {
  const cTlf1_3 = topLevelFunction1;
  const cTlf1_4 = topLevelFunction1;
  const cTlf2_2 = topLevelFunction2;
  var vTlf1_3 = topLevelFunction1;
  var vTlf1_4 = topLevelFunction1;
  var vTlf2_2 = topLevelFunction2;

  const CheckIdentical(cTlf1, cTlf1_2);
  const CheckIdentical(cTlf1_3, cTlf1_4);
  const CheckIdentical(cTlf1, cTlf1_4);
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

  Expect.notEquals(cTlf1, cTlf2);
  Expect.notEquals(cTlf2, cTlf1_3);
  Expect.notEquals(cTlf1, cTlf2_2);
  Expect.notEquals(vTlf1, vTlf2);
  Expect.notEquals(vTlf2, vTlf1_3);
  Expect.notEquals(vTlf1, vTlf2_2);
}
