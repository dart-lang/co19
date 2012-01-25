/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The type parameters of a generic G are in scope in the bounds of all of
 * the type parameters of G. The type parameters of a generic class or interface
 * declaration G are also in scope in the extends and implements clauses of G
 * (if these exist) and in the non-static members of G.
 * @description Checks that a compile-time error is produced if type parameter is used
 * in a static method in a type test expression.
 * @compile-error
 * @author iefremov
 */

class C<T> {
  static f() {
    Expect.isTrue(null is T);
  }
}

main() {
  try {
    C.f();
  } catch(var x){}
}