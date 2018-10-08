/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a postfix expression of the form C.v-- is equivalent
 * to executing (){var r = C.v; C.v = r - 1; return r}().
 * The static type of such an expression is the static type of C.v.
 * @description Checks that static type of C.v-- is static type C.v
 * static-clean
 * @author sgrekhov@unipro.ru
 */
class C {
  static int v = 0;
  static int v2;
}

main() {
  int a = C.v--;
  try {
    int b = C.v2--;
  } catch (e) {}
}
