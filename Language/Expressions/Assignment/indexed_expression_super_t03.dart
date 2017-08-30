/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An assignment of the form super[e1] = e2 is equivalent to the
 * expression super.[e1] = e2
 * @description Checks that method noSuchMethod is invoked
 * (which results in NoSuchMethodError) if superclass doesn't define an
 * []= operator.
 * @issue 25540
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

@proxy
class A {
  operator [](idx) {}
}

class C extends A {
  test() {
    Expect.throws(() {super[0] = 1;}, (e) => e is NoSuchMethodError);
  }
}

main() {
  C c = new C();
  c.test();
}
