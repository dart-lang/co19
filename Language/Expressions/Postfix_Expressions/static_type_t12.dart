/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a postfix expression of the form e1?.v-- is
 * equivalent to executing ((x) => x == null? null: x.v--)(e1) unless e1 is
 * a type literal, in which case it is equivalent to e1.v-- .
 * The static type of such an expression is the static type of e1.v.
 * @description Checks that static type of e1?.v-- is static type of e1.v. e1
 * is a type literal
 * static-clean
 * @author sgrekhov@unipro.ru
 */
class C {
  static int v = 0;
  static int v2;
}

main() {
  int a1 = C?.v--;
  try {
    int a2 = C?.v2--;
  } catch (e) {}
}
