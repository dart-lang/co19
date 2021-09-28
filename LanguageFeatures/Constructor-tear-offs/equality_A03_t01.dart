// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Test equality of function and methods tearoffs.
///
/// @description Checks equality of local non-generic functions
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

main() {
  int localFunction1() => 42;
  int localFunction2() => 42;

  var f1_1 = localFunction1;
  var f1_2 = localFunction1;
  var f2 = localFunction2;

  Expect.equals(f1_1, f1_2);
  Expect.identical(f1_1, f1_2);
  Expect.notEquals(f2, f1_2);
}
