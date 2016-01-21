/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of i is:
 * • The declared return type of T.m, if T has an accessible instance getter
 *   named m.
 * • The declared return type of m, if T is Type, e is a constant type literal
 *   and the class corresponding to e declares an accessible static getter
 *   named m.
 * • The static type of function T.m if T has an accessible instance method
 *   named m.
 * • The static type of function m, if T is Type, e is a constant type literal
 *   and the class corresponding to e declares an accessible static method
 *   named m.
 * • The type dynamic otherwise.
 * @description Check that static type of an accessible static method is
 * Function
 * @static-clean
 * @author sgrekhov@unipro.ru
 */

class C {
  static int m() => 1;
}

main() {
  Function x = C.m;
}
