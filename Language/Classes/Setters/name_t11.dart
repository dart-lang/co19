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
 * @description Checks that static setter can be found by name by
 * appending string '=' to its name. Compile time error occurs otherwise
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class C {
  static int mValue;
  static void set m(int val) {
    C.mValue = val;
  }
}

main() {
  var x = C#m=;
  x(1);
}
