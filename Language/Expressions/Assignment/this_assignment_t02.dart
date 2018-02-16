/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment a of the form v = e proceeds as
 * follows:
 * ...
 * Otherwise, the assignment is equivalent to the assignment this.v = e.
 * @description Checks that an assignment of the form v = e, where v is not
 * declared in the lexical scope is equivalent to the assignment this.v = e and
 * causes compile error
 * @compile-error
 * @author msyabro
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class C {
  test() {
    Expect.throws(() {v = 1;}, (e) => e is NoSuchMethodError);
  }
}

main() {
  C c = new C();
  c.test();
}
