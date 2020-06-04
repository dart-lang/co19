/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if a setter declares a return type other
 * than void
 * @description Checks that it is a static warning if a setter declares a return
 * type other than void
 * @static-warning
 * @author vasya
 * @issue 42179
 */

class C {
  int set foo(var x) => 42; /// static type warning
}

main() {
  new C().foo = 1;
}
