/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the arity of the user-declared
 * operator ~ is not 0.
 * @description Checks that a compile-time error is produced if a user-defined
 * operator ~ specifies one parameter.
 * @compile-error
 * @author vasya
 */

class C {
  operator ~(var v) {}
}

main() {
  try {
    var x = ~(new C());
  } catch (e) {}
}
