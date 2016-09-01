/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of the expression e1.v = e2 is the static type
 * of e2
 * @description Checks that static type of the expression e1.v = e2 is the
 * static type of e2. Test the case when e1 an instance of some class
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

class A {}

class C {
  static A v;
}

main() {
  C y = (C.v = new A());
}
