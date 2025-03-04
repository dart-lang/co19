// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's not an error to read definitely assigned local variable in
/// the form var x;
///
/// @description Checks that it's not an error to read definitely assigned local
/// variable in the form var x;.
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

main() {
  var x1;
  x1 = 42;
  Expect.equals(42, x1);

  for (var x2 = 0; x2 < 1; x2++) {
    Expect.equals(0, x2);
  }
  for (var x3 in [42]) {
    Expect.equals(42, x3);
  }

  var x4;
  x4 = 42;
  x4++;
  Expect.equals(43, x4);

  var x5;
  x5 = 42;
  ++x5;
  Expect.equals(43, x5);
}
