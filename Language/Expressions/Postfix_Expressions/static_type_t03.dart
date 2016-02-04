/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a postfix expression of the form e1.v++ is equivalent
 * to executing (x){var r = x.v; x.v = r + 1; return r}(e1).
 * The static type of such an expression is the static type of e1.v.
 * @description Checks that static type of e1.v++ is static type of e1.v
 * static-clean
 * @author sgrekhov@unipro.ru
 */
class C {
  int v = 0;
  int v2;
}

main() {
  C c = new C();
  int a = c.v++;
  try {
    int a2 = c.v2++;
  } catch (e) {}
}
