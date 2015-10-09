/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form super#m
 * proceeds as follows:
 * ...
 * If setter lookup failed, a NoSuchMethodError is thrown.
 *
 * @description Check that NoSuchMethodError is thrown is setter lookup failed
 *
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';

class A {
}

class C extends A {
  void set m(int val) {
  }

  void test() {
    Expect.throws(() {var i = super#m=;}, (e) => e is NoSuchMethodError);
  }
}

main() {
  C c = new C();
  c.test();
}
