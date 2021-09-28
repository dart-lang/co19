// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Test equality of function and methods tearoffs.
///
/// @description Checks equality of local non-generic functions
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

var g;

main() {
  int localFunction1() => 42;

  var f1 = localFunction1;
  g = localFunction1;
  Expect.equals(f1, g);
  Expect.identical(f1, g);
  {
    int localFunction2() => 42;
    var f2 = localFunction2;
    g = localFunction2;
    Expect.equals(f2, g);
    Expect.identical(f2, g);
  }
  {
    int localFunction3() => 42;
    f1 = localFunction3;
    g = localFunction3;
  }
  Expect.equals(f1, g);
  Expect.identical(f1, g);
}
