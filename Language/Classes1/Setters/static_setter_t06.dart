/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  It is a static warning if a class declares a static setter
 * named v= and also has a non-static member named v.
 * @description Checks that a compile error is arisen if a class has an
 * explicitly declared static setter and an instance getter with the same name.
 * @compile-error
 * @author ngl@unipro.ru
 */

class C {
  static int n;
  get v => 5;
  static set v(int v1) {
    n = v1;
  }
}

main() {
  C.v = 2;
}
