/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any use of a type [T] which is not well-bounded is a
 * compile-time error.
 * @description Checks that compile error is thrown when function alias with
 * type parameters which are not bounded well.
 * @author iarkh@unipro.ru
 */

class A<T extends A<T>> {}

typedef void B<X extends A<X>>(X);

main() {
  B<A> b2;
  B<void> b4;
  B<Null> b5;

  B<A<dynamic>> b6;
  B<A<void>> b8;
  B<A<Null>> b9;
}
