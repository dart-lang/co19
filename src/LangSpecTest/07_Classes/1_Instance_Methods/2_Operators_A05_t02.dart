/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the arity of a user-declared 
 * operator with one of the names: ~, negate is not 0.
 * @description Checks that a compile-time error is produced if a user-defined
 * operator negate specifies one required parameter.
 * @compile-error
 * @author vasya
 * @reviewer iefremov
 * @reviewer rodionov
 * @needsreview issue 979
 */

class C {
  operator negate(var v) {
    return -v;
  }
}

main() {
  try {
    var x = -(new C());
  } catch(var e) {}
}
