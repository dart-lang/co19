/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The name of a setter is obtained by appending the string ‘=’
 * to the identifier given in its signature. Hence, a setter name can never
 * conflict with, override or be overridden by a getter or method.
 *
 * @description Checks that setter can not be found by name by
 * appending string '=' to its name even if there are method with the same
 * name
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

class C {
  int mValue;

  void set m(int val) {
    this.mValue = val;
  }

  void m() {}
}

main() {
  C c = new C();
  var x = c#m=;
  x(1);
}
