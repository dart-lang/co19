/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  It is a compile time error if an element of a constant list
 * literal is not a compile-time constant. It is a compile time error if the
 * type argument of a constant list literal includes a type parameter.
 * @description Checks that it is no error if the type argument of a constant
 * list literal includes a type variable.
 * @issue 27492
 * @author msyabro
 * @reviewer kaigorodov
 */

class C<T> {
  test() {
    const <T>[null, null];
  }
}

main() {
  new C().test();
}
