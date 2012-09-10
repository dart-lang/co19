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
 * has more type parameters than its declared factory class if the latter implements the former.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */

class C<T> implements I<T, T, T, T> {
  C() {}
}

interface I<Q, R, S, T> default C<T> {
  I();
}

main() {
  try {
    new I<int, bool, Dynamic, String>();
  } catch(e) {}
}
