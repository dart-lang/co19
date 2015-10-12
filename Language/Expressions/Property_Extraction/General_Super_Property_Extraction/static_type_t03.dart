/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form super#m
 * proceeds as follows:
 * ...
 * The static type of i is the static type of the function S.m, if S has an
 * accessible instance member named m. Otherwise the static type of i is
 * dynamic.
 *
 * @description Check that static type of the extracted method is dynamic
 * if no method named m found in a superclass
 * @static-clean
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/dynamic_check.dart';

class A {
}

class B {
}

class C extends A {
  int m() => 2;

  void test() {
    if (isCheckedMode()) {
      try {
        B i = super#m;// Here we expect that static type of super#m is dynamic
                      // Dynamic can be assigned to B without static warning.
      } on NoSuchMethodError {}
    }

  }
}

main() {
  C c = new C();
  c.test();
}
