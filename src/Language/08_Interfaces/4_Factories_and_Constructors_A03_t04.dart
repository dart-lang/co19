/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let I be an interface named NI with factory class F, and let NF be the
 * name of F. It is a compile-time error if I and F do not have the same number
 * of type parameters. If I has n type parameters, then the name of the ith type
 * parameter of I must be identical to the name of the ith type parameter of F ,
 * for i ∈ 1..n, or a compile-time error occurs.
 * @description Checks that it is a compile-time error if an interface 
 * has more type parameters than its declared factory class as long as the latter
 * does not implement the former.
 * @compile-error
 * @author rodionov
 * @reviewer msyabro
 */

class C2<T> {
  factory I2() {}
}

interface I2<S, T> default C2<T> {
  I2();
}

main() {
  try {
    new I2();
  } catch(var e) {}
}
