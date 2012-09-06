/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if any of the type arguments to a constructor of
 * a generic type invoked by a new expression or a constant object expression do
 * not denote types in the enclosing lexical scope.
 * @description Checks that it is a compile-time error if any of the type arguments to
 * a constructor of a generic type invoked by a new expression do not denote types
 * in the enclosing lexical scope.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 */

class A<T> {
}

main() {
  try {
    var o = new A<D>();
  } catch(e) {}
}
