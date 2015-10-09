/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if a class declares a static getter named 
 * v and also has a non-static setter named v =.
 * @description Checks that a static warning is arisen if a class has an 
 * explicitly declared static getter and an explicitly declared instance 
 * setter with the same name.
 * @static-warning
 * @author ngl@unipro.ru
 */

class C {
  int n;
  static get v { return 5; }  /// static type warning
  set v(int v1) {
    n = v1;
  }
}

main() {
  C.v;
}
