/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Any use of a type [T] which is not well-bounded is a
 * compile-time error.
 * @description Checks that compile error is thrown when class with super
 * bounded type parameter is declared
 * @Issue 37028, 37050
 * @author iarkh@unipro.ru
 */

class A<T extends A<T>> {}

class B1<X extends A<X>> {}
class B5<X extends A<A<Object>>> {}
class B6<X extends A<A<dynamic>>> {}
class B7<X extends A<A<void>>> {}
class B8<X extends A<A<Null>>> {}

main() {}
