/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any use of a type [T] which is not well-bounded is a
 * compile-time error.
 * @description Checks that compile error is not thrown when variable with super
 * bounded type parameter is declared
 * @Issue 36959
 * @author iarkh@unipro.ru
 */

class A<T extends A<T>> {}

main() {
  A a1;

  A<dynamic> a2;
  A<Object> a3;
  A<void> a4;
  A<Null> a5;

  A<A<dynamic>> a6;
  A<A<Object>> a7;
  A<A<void>> a8;
  A<A<Null>> a9;

  A<A> a10;
  A<A<A>> a11;
}
