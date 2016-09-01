/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment of the form e1.v = e2 proceeds as
 * follows:
 * The expression e1 is evaluated to an object o1. Then, the expression e2 is
 * evaluated to an object o2.
 * ...
 * It is a static type warning if the static type of e2 may not be assigned to
 * the static type of the formal parameter of the setter v =.
 * @description Checks that it is a compile error if the static type of e
 * may not be assigned to the static type of C.v.
 * @compile-error
 * @author msyabro
 */

class C {
  static int v;
}

main() {
  C.v = true;
}
