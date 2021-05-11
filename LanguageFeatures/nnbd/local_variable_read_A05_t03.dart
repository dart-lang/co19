// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile time error to read a local variable when the
/// variable is potentially unassigned unless the variable is non-final and has
/// nullable type, or is late
///
/// @description Checks that it's not a compile time error to read a non-late and
/// non-final nullable local variable when the variable is potentially unassigned
///
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-strong
import "../../Utils/expect.dart";

main() {
  bool b = true;
  int? x1;
  if (b) {
    x1 = 42;
  }
  Expect.equals(42, x1);

  b = false;
  int? x2;
  if (b) {
    x2 = 42;
  }
  Expect.isNull(x2);
}
