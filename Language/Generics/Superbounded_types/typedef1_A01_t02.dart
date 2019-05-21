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
 * @Issue 36959
 * @author iarkh@unipro.ru
 */

class A<T extends A<T>> {}

typedef B1<X extends A<dynamic>> = void Function();
typedef B2<X extends A<Null>>    = void Function();
typedef B3<X extends A<Object>>  = void Function();
typedef B4<X extends A<void>>    = void Function();

typedef B5<X extends A<A<dynamic>>> = void Function();
typedef B6<X extends A<A<Null>>>    = void Function();
typedef B7<X extends A<A<Object>>>  = void Function();
typedef B8<X extends A<A<void>>>    = void Function();

main() {
}
