/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A constant variable is a variable whose declaration includes the 
 * modifier const. A constant variable is always implicitly final.
 * @description Checks that constant variables are initialized properly.
 * @author msyabro
 * @reviewer iefremov
 */
import "../../Utils/expect.dart";

import "dart:math" as Math;

const int i = -100;
const bool b = false;
const String s = "string";
const x = 1;

main() {
  const double pi = Math.pi;
  const List l = const [0,1,2,3];
  const Map m = const {'a': 1, 'b': 2};
  const String e = "OneTwo";
  const y = 2;

  Expect.identical(-100, i);
  Expect.identical(false, b);
  Expect.identical("string", s);
  Expect.identical(Math.pi, pi);
  Expect.identical(const [0,1,2,3], l);
  Expect.identical(const {'a': 1, 'b': 2}, m);
  Expect.identical("OneTwo", e);
  Expect.identical(1, x);
  Expect.identical(2, y);
}
