/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If e is of the form
 * const T.id(a1, ..., an, xn+1: an+1, ..., xn+k: an+k) it is a compile-time
 * error if T.id is not the name of a constant constructor declared by the
 * type T.
 * @description Checks that it is a compile-time error if id
 * is the name of an instance method declared by the type T.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

class  A {
  method() {}
}

main() {
  try {
    const A.method();
  } catch (e) {}
}
