// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile time error to assign a value to a final, late
/// local variable if it is definitely assigned. Thus, it is not a compile time
/// error to assign to a potentially unassigned final, late local variable.
///
/// @description Checks that it is not a compile time error to assign to a
/// potentially unassigned final, late local variable
///
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

main() {
  bool b = (() => false)();
  late final x1;
  if (b) {
    x1 = 42;
  }
  x1 = 0;
  Expect.equals(0, x1);

  b = (() => true)();
  late final x2;
  if (b) {
    x2 = 42;
  }
  Expect.throws(() {x2 = 0;});

  b = (() => false)();
  late final int x3;
  if (b) {
    x3 = 42;
  }
  x3 = 0;
  Expect.equals(0, x3);

  b = (() => true)();
  late final int x4;
  if (b) {
    x4 = 42;
  }
  Expect.throws(() {x4 = 0;});

  b = (() => false)();
  late final int? x5;
  if (b) {
    x5 = 42;
  }
  x5 = 0;
  Expect.equals(0, x5);

  b = (() => true)();
  late final int? x6;
  if (b) {
    x6 = 42;
  }
  Expect.throws(() {x6 = 0;});
}
