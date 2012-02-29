/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error for a class or interface to attempt to extend or
 * implement int.
 * @description Checks that a user-defined interface cannot extend int.
 * @compile-error
 * @author iefremov
 * @reviewer rodionov
 */

interface A extends int {}

class B implements A {}

main() {
  try {
    new B();
  } catch(var x) {}
}
