/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment of the form super.v = e proceeds as
 * follows:
 * Let g be the method currently executing, and let C be the class in which
 * g was looked up. Let Sdynamic be the superclass of C. The expression e is
 * evaluated to an object o.
 * ...
 * The value of the assignment expression is o irrespective of whether setter
 * lookup has failed or succeeded.
 * @description Checks the value of an assignment of the form super.v = e is
 * e evaluated to o.
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class A {
  var v;
}

class C extends A {
  test() {
    Expect.equals(1, super.v = 1);
    Expect.equals(2, super.v = 2);
    Expect.equals("12", super.v = "1" "2");
    Expect.equals(true, super.v = 1 < 2);
  }
}

main() {
  C c = new C();
  c.test();
}
