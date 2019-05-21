/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any use of a type [T] which is not well-bounded is a
 * compile-time error.
 * @description Checks that compile error is thrown when function alias with not
 * well bounded type parameter is declared
 * @Issue 37031
 * @author iarkh@unipro.ru
 */

class A<T extends A<T>> {}

typedef void B1<X extends A>(X);      //# 01: compile-time error
typedef void B2<X extends A<A>>(X);   //# 02: compile-time error
typedef void B3<X extends A<int>>(X); //# 03: compile-time error

main() {
}
