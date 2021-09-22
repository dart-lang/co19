// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant variable is a variable whose declaration includes the 
/// modifier const. A constant variable is always implicitly final.
/// @description Checks that constant variables are initialized properly.
/// @author msyabro

import "../../Utils/expect.dart";

import "dart:math" as Math;

const int i = -100;
const bool b = false;
const String s = "string";
const x = 1;

main() {
  const double pi = Math.pi;
  const List<int> l = const [0, 1, 2, 3];
  const Map<String, int> m = const {'a': 1, 'b': 2};
  const String e = "OneTwo";
  const y = 2;

  const CheckIdentical(-100, i);
  const CheckIdentical(false, b);
  const CheckIdentical("string", s);
  const CheckIdentical(Math.pi, pi);
  const CheckIdentical(const [0, 1, 2, 3], l);
  const CheckIdentical(const {'a': 1, 'b': 2}, m);
  const CheckIdentical("OneTwo", e);
  const CheckIdentical(1, x);
  const CheckIdentical(2, y);
}
