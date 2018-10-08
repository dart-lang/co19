/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A constant variable must be initialized to a compile-time 
 * constant or a compile-time error occurs.
 * @description Checks that constant variables should be initialized to
 * a compile-time constant.
 * @author msyabro
 * @reviewer iefremov
 */
import "../../Utils/expect.dart";

import "dart:math" as Math;

class Foo {
  const Foo();
}

const int i = -100;
const bool b = false;
const String s = "string";
const double pi = Math.pi;
const Foo foo = const Foo();
const List l = const [0,1,2,3];
const Map m = const {'a': 1, 'b': 2};
const bool bOr = true || false;
const int iPlus = 5 + i;

main() {
  Expect.identical(-100,  i);
  Expect.identical(false,  b);
  Expect.identical("string",  s);
  Expect.identical(Math.pi,  pi);
  Expect.identical(const Foo(),  foo);
  Expect.identical(const [0,1,2,3],  l);
  Expect.identical(const {'a': 1, 'b': 2},  m);
  Expect.identical(true || false,  bOr);
  Expect.identical(-95,  iPlus);
}
