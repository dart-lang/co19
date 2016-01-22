/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form super#m
 * proceeds as follows:
 * ...
 * The static type of i is the static type of the function Sstatic.m, if Sstatic
 * has an accessible instance member named m. Otherwise the static type of i is
 * dynamic.
 *
 * @description Check that static type of the extracted getter is Function
 * @static-clean
 * @author sgrekhov@unipro.ru
 */

class A {
  int get m => 1;
}

class C extends A {
  int get m => 2;

  void test() {
    Function i = super#m;
  }
}

main() {
  C c = new C();
  c.test();
}
