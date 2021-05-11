// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile time error to assign a value to a final, non-late
/// local variable which is potentially assigned. Thus, it is not a compile time
/// error to assign to a definitely unassigned final local variable.
///
/// @description Checks that it's not a compile time error to assign to a
/// definitely unassigned final local variable.
///
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-strong
import "../../Utils/expect.dart";

main() {
  final x1;
  x1 = 42;
  Expect.equals(42, x1);

  final x2;
  bool b = true;
  if (b) {
    x1;
  }
  x2 = 42;
  Expect.equals(42, x2);

  final int x3;
  x3 = 42;
  Expect.equals(42, x3);

  final int x4;
  if (b) {
    x1;
  }
  x4 = 42;
  Expect.equals(42, x4);

  final int? x5;
  x5 = 42;
  Expect.equals(42, x5);

  final int? x6;
  if (b) {
    x1;
  }
  x6 = 42;
  Expect.equals(42, x6);
}
