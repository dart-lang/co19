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
 * evaluated to an object o. Then, the setter v = is looked up in Sdynamic with
 * respect to the current library. The body of v = is executed with its formal
 * parameter bound to o and this bound to this.
 * @description Checks that in assignment of the form super.v = e the body of
 * the setter v= is executed
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class A {
  var _v;
  var t;

  set v(val) {
    _v = val;
    t = val + 1;
  }
  get v {
    return _v;
  }
}

class C extends A {
  test() {
    super.v = 1;
    Expect.equals(1, super.v);
    Expect.equals(2, super.t);
    super.v = 2;
    Expect.equals(2, super.v);
    Expect.equals(3, super.t);
    super.v = 1;
    Expect.equals(1, super.v);
    Expect.equals(2, super.t);
    super.v = 2 * 6;
    Expect.equals(12, super.v);
    Expect.equals(13, super.t);
  }
}

main() {
  C c = new C();
  c.test();
}
