/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a postfix expression of the form v--, where v is an
 * identifier, is equivalent to executing (){var r = v; v = r - 1; return r}().
 * The static type of such an expression is the static type of v.
 * @description Checks that static type of v-- is static type of v
 * static-clean
 * @author sgrekhov@unipro.ru
 */

main() {
  int a1 = 0;
  int b1 = a1--;
  try {
    int a2;
    int b2 = a2--;;
  } catch (e) {}
}
