/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment of the form e1.v = e2 proceeds as
 * follows:
 * The expression e1 is evaluated to an object o1. Then, the expression e2 is
 * evaluated to an object o2. Then, the setter v = is looked up in o1 with
 * respect to the current library. If o1 is an instance of Type but e1 is not a
 * constant type literal, then if v = is a setter that forwards to a static
 * setter, setter lookup fails. Otherwise, the body of v = is executed with its
 * formal parameter bound to o2 and this bound to o1.
 * @description Checks the value of an assignment of the form e1.v = e2 is e
 * evaluated to o. Test the case when e1 is a constant type literal
 * @author msyabro
 */
import '../../../Utils/expect.dart';

class C {
  static var v;
}

main() {
  Expect.equals(1, C.v = 1);
  Expect.equals(2, C.v = 2);
  Expect.equals(1, C.v = 1);
  Expect.equals(12, C.v = 2 * 6);
}
