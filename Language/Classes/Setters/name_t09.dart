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
 * @description Checks that static setter cannot be found by name without
 * appending string '=' to its name. Compile error occurs otherwise
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

class C {
  static void set m(int val) {
  }
}

main() {
  C#m;
}
