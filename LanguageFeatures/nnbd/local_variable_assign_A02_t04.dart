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

// Requirements=nnbd-strong
import "../../Utils/expect.dart";

main() {
  late final x1;
  var f1 = () {
    x1 = 42;
  };
  x1 = 0;
  Expect.equals(0, x1);
  Expect.throws(() {f1();});

  late final x2;
  var f2 = () {
    x2 = 42;
  };
  f2();
  Expect.throws(() {x2 = 0;});

  late final int x3;
  var f3 = () {
    x3 = 42;
  };
  x3 = 0;
  Expect.equals(0, x3);
  Expect.throws(() {f3();});

  late final int x4;
  var f4 = () {
    x4 = 42;
  };
  f4();
  Expect.throws(() {x4 = 0;});

  late final int? x5;
  var f5 = () {
    x5 = 42;
  };
  x5 = 0;
  Expect.equals(0, x5);
  Expect.throws(() {f5();});

  late final int? x6;
  var f6 = () {
    x6 = 42;
  };
  f6();
  Expect.throws(() {x6 = 0;});
}
