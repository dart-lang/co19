/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion As with the if statement, the condition expression of an if
 * element induces type promotion in the "then" element of the if when the
 * condition expression shows that a variable has some type and promotion isn't
 * otherwise aborted.
 *
 * @description Checks that it is a compile error if type promotion occurs in
 * the "else" element
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

class A {
  int get a => 0;
}
class C extends A {
  int get c => 1;
}


main() {
  A c = new C();
  [
    if (c is C)
      1
    else
      c.c;
  ];
}
