/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let e be a constant object expression of the form
 * const T.id(a1, .., an, xn+1: an+1, …, xn+k: an+k) or the form
 * const T(a1, .., an, xn+1: an+1, …, xn+k: an+k). It is a compile-time error
 * if T includes any type parameters.
 * @description Checks that it is a compile-time error if T
 * includes any type parameters as a type argument.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

class S<U> {
  const S();
}

main() {
  try {
    S s=const S<T>(); 
  } catch(e) {}
}
