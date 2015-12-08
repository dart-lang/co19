/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If e of the form
 * const T(a1, ..., an, xn+1: an+1, ..., xn+k: an+k) it is a compile-time
 * error if the type T does not declare a constant constructor with the same
 * name as the declaration of T.
 * @description Checks that it is a compile-time error if T declares a
 * non-constant constructor with the same name as the declaration of T.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

class  T {
  T() {}
}

main() {
  try {
    const T();
  } catch (e) {}
}
