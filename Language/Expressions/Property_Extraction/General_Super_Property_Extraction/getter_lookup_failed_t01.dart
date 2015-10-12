/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form super#m
 * proceeds as follows:
 * ...
 * If getter lookup failed, a NoSuchMethodError is thrown.
 *
 * @description Check that if getter lookup failed, a NoSuchMethodError
 * is thrown
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
}

class C extends A {
  int get m => 1;

  void test() {
    Expect.throws(() {var f = super#m;}, (e) => e is NoSuchMethodError);
  }
}

main() {
  C c = new C();
  c.test();
}
