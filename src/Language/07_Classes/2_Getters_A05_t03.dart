/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if a getter m1 overrides (7.8.1) a getter 
 * or method m2 and the type of m1 is not a subtype of the type of m2. 
 * @description Checks that a static warning is produced even if the overriding
 * getter is implicit as long as the return types of both getters are not mutually
 * assignable.
 * @static-warning
 * @author iefremov
 * @reviewer pagolubev
 * @reviewer rodionov
 */

class A {
  double get n() {}
}

class C extends A {
  int n;
}

main() {
  var n = new C().n;
}
