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
 * evaluated to an object o. Then, the setter v = is looked up inSdynamic with
 * respect to the current library. The body of v = is executed with its formal
 * parameter bound to o and this bound to this.
 * @description Checks that expression e is evaluated even if super.v=
 * assignment failed
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

int evaluationCount = 0;

int e() {
  return evaluationCount++;
}

class A {
}

class C extends A {
  var v = 1;

  test() {
    Expect.throws(() {super.v = e();}, (e) => e is NoSuchMethodError); /// static type warning
    Expect.equals(1, evaluationCount);
  }
}

main() {
  C c = new C();
  c.test();
}
