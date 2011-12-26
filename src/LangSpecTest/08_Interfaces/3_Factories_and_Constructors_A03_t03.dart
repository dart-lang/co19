/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let I be an interface named NI with factory class F, and let NF be the
 * name of F. If F implements I then it is a compile-time error if I and F do not
 * have the same number of type parameters.
 * @description Checks that it is a compile-time error if an interface 
 * has fewer or more type parameters than its declared factory class as long as the latter
 * does not implement the former.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 */

class C<S, T> {
  factory I() {}
}

interface I<T> default C<T, T> {
  I();
}

class C2<T> {
  factory I2() {}
}

interface I2<S, T> default C2<S> {
  I2();
}

main() {
  try {
    new I();
    new I2();
  } catch(var e) {}
}
