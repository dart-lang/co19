/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if a class declares a static getter named 
 * v and also has a non-static setter named v =.
 * @description Checks that a static warning is arisen if a class has an 
 * implicitly declared static getter and an implicitlly declared instance 
 * setter with the same name.
 * @compile-error
 * @author ngl@unipro.ru
 */

class C {
  static var v;
  int v = 1;
}

main() {
  C.v();
}
