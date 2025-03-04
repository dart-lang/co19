// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile time error to read a local variable when the
/// variable is potentially unassigned unless the variable is non-final and has
/// nullable type, or is late
///
/// @description Checks that it's not a compile time error to read a late
/// nullable local variable when the variable is potentially unassigned
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

main() {
  bool b = true;
  late int x1;
  if (b) {
    x1 = 42;
  }
  Expect.equals(42, x1);

  b = false;
  late int x2;
  if (b) {
    x2 = 42;
  }
  Expect.throws(() {x2;});

  b = true;
  late int? x3;
  if (b) {
    x3 = 42;
  }
  Expect.equals(42, x3);

  b = false;
  late int? x4;
  if (b) {
    x4 = 42;
  }
  Expect.throws(() {x4;});

  b = true;
  late final int x5;
  if (b) {
    x5 = 42;
  }
  Expect.equals(42, x5);

  b = false;
  late final int x6;
  if (b) {
    x6 = 42;
  }
  Expect.throws(() {x6;});

  b = true;
  late final int? x7;
  if (b) {
    x7 = 42;
  }
  Expect.equals(42, x7);

  b = false;
  late final int? x8;
  if (b) {
    x8 = 42;
  }
  Expect.throws(() {x8;});

  b = true;
  late var x9;
  if (b) {
    x9 = 42;
  }
  Expect.equals(42, x9);

  b = false;
  late var x10;
  if (b) {
    x10 = 42;
  }
  Expect.throws(() {x10;});

  b = true;
  late final x11;
  if (b) {
    x11 = 42;
  }
  Expect.equals(42, x11);

  b = false;
  late final x12;
  if (b) {
    x12 = 42;
  }
  Expect.throws(() {x12;});
}
