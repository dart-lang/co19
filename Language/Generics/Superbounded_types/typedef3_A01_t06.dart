/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any use of a type [T] which is not well-bounded is a
 * compile-time error.
 * @description Checks that compile error is not thrown when non-function type
 * alias variable with not well bounded type parameter is declared
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

class A<T> {}

typedef B<X extends A<X>> = A<X>;

main() {
  B<A<int>> b1;     //# 01: compile-time error
  B<A<A<A<B>>>> b2; //# 02: compile-time error
}
