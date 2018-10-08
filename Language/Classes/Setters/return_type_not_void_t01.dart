/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a setter declares a return type
 * other than void
 * @description Checks that a compile-time error is produced if a setter
 * declares int as its return type.
 * @compile-error
 * @author vasya
 */

class C {
  int set foo(var x) {
  }
}

main() {
  new C().foo = 1;
}
