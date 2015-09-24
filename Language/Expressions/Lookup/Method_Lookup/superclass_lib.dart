/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
library superclass_lib;

class A {
  int m() => 1;
  int m1() => 10;
  int m3() => 100;
  int _privateMethod() => 1000;
}

class C extends A {
  int m() => 2;
  int m2() => 20;
  int m3();
  int _privateMethod() => 2000;
}
