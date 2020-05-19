/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of the expression e1.v = e2 is the static type
 * of e2
 * @description Checks that static type of the expression e1.v = e2 is the
 * static type of e2
 * @static-clean
 * @author sgrekhov@unipro.ru
 */

class A {}

class C {
  var v;
}

main() {
  C c = new C();
  C y = (c.v = new C());
}
