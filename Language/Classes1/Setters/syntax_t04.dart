/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * setterSignature:
 *   returnType? set identifier formalParameterList
 * ;
 * @description Checks if static setter returns value other than void, then
 * compile-time error occurs
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

class C {
  static int set s2(int value) {return 2;} /// static type warning
}

main() {
  C.s2 = 0;
}
