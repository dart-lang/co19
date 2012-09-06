/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  It is a compile time error if the type argument of a constant
 * list literal includes a type variable.
 * @description Checks that it is a compile-time error if the type argument
 * of a constant list literal includes a type variable.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 */

class C<T> {
  test() {
    const <T>[null, null];
  }
}

main() {
  try {
    new C().test();
  } catch(e) {}
}