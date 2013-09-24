/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an assignment of the form e1[e2] = e3 is equivalent to the
 * evaluation of the expression (a, i, e){a.[]=(i, e); return e;} (e1, e2, e3).
 * The static type of the expression e1 [e2 ] = e3 is the static type of e3.
 * @description Checks that static type of e1[e2]=e3 is static type of e3
 * @static-clean
 * @author ilya
 */
import "../../Utils/expect.dart";

class D {}

class C {
  operator[]= (index, value) {}
}

main() {
  C c = new C();
  D d = (c[100] = new D());
}
