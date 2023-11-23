// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's not an error to read potentially assigned local variable in
/// the form var x;
///
/// @description Checks that it's not an error to read potentially assigned local
/// variable in the form var x;.
///
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak
import "../../../Utils/expect.dart";

main() {
  var x1;
  bool b = true;
  if (b) {
    x1 = 42;
  }
  Expect.equals(42, x1);

  var x2;
  if (b) {
    x2 = 42;
  }
  Expect.equals(42, x2++);

  var x3;
  b = false;
  if (b) {
    x3 = 42;
  }
  Expect.isNull(x3);

  var x4;
  if (b) {
    x4 = 42;
  }
  Expect.throws(() {x4++;});
}
