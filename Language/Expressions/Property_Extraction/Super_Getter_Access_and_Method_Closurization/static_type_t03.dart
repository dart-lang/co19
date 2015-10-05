/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of i is:
 * • The declared return type of S.m, if S has an accessible instance getter
 * named m.
 * • The static type of function S.m if S has an accessible instance method
 * named m.
 * • The type dynamic otherwise.
 * @description Check that static type of the extracted method is dynamic
 * if no member named m found
 * @static-clean
 * @author sgrekhov@unipro.ru
 */

@proxy class A {
}

class C extends A {
  void test() {
    try {
      var i = super.m;
      i.something; // i is dynamic, so no static warning here
    } on NoSuchMethodError {}
  }
}

main() {
  C c = new C();
  c.test();
}
