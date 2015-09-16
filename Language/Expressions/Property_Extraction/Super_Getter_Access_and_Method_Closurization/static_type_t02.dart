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
 * @description Check that static type of the extracted method is static type
 * of the function
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
  int m() => 1;
}

class C extends A {
  String m() => "s";

  void test() {
      var i = super.m;
      Expect.isTrue(i is Function);
  }
}

main() {
  C c = new C();
  c.test();
}
