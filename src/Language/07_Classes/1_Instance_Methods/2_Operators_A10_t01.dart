/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if the return type of the user-declared
 * operator negate is explicitly declared and not a numerical type.
 * @description Checks that it is a static warning if the return type of
 * the user-declared operator negate is explicitly declared and not a numerical type.
 * @static-warning
 * @author msyabro
 */

class C {
  String operator negate() {}
}

main() {
  C c = new C();
  -c;
}
