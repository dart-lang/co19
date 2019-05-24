/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any use of a type [T] which is not well-bounded is a
 * compile-time error.
 * @description Checks that compile error is not thrown when function alias with
 * well bounded type parameter is declared
 * @author iarkh@unipro.ru
 */

class A<T extends A<T>> {}

typedef X B<X extends A<X>>();

main() {
  B b1;

  B<dynamic> b2;
  B<Object> b3;
  B<void> b4;
  B<Null> b5;

  B<A<dynamic>> b6;
  B<A<Object>> b7;
  B<A<void>> b8;
  B<A<Null>> b9;

  B<A> b10;
  B<A<A>> b11;
}
