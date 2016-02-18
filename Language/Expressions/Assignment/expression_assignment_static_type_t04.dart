/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of the expression e1.v = e2 is the static type
 * of e2
 * @description Checks that static type of e1.v = e2 is static type of e2
 * @static-clean
 * @author ilya
 */

class C {
  int v;
}

main() {
  C c = new C();
  int x = (c.v = 1);
}
