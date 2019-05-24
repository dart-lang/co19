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

typedef void B1<X extends A<dynamic>>();
typedef void B2<X extends A<Null>>();
typedef void B3<X extends A<Object>>();
typedef void B4<X extends A<void>>();

typedef void B5<X extends A<A<dynamic>>>();
typedef void B6<X extends A<A<Null>>>();
typedef void B7<X extends A<A<Object>>>();
typedef void B8<X extends A<A<void>>>();

main() {
}
