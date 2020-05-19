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

typedef B1<X extends A>     = void Function();      //# 01: compile-time error
typedef B2<X extends A<A>>  = void Function();      //# 02: compile-time error
typedef B3<X extends A>     = void Function();      //# 03: compile-time error
typedef B4<X extends A<int>>  = void Function();    //# 04: compile-time error


typedef B5<X extends A>       = X Function();       //# 05: compile-time error
typedef B6<X extends A<A>>    = X Function();       //# 06: compile-time error
typedef B7<X extends A>       = X Function();       //# 07: compile-time error
typedef B8<X extends A<int>>  = X Function();       //# 08: compile-time error

typedef B9<X extends A>       = void Function(X);   //# 09: compile-time error
typedef B10<X extends A<A>>   = void Function(X);   //# 10: compile-time error
typedef B11<X extends A>      = void Function(X);   //# 11: compile-time error
typedef B12<X extends A<int>> = void Function(X);   //# 12: compile-time error

typedef B13<X extends A>      = void Function<X1 extends X>(); //# 13: compile-time error
typedef B14<X extends A<A>>   = void Function<X1 extends X>(); //# 14: compile-time error
typedef B15<X extends A>      = void Function<X1 extends X>(); //# 15: compile-time error
typedef B16<X extends A<int>> = void Function<X1 extends X>(); //# 16: compile-time error

typedef B17<X extends A>      = X Function(X);      //# 17: compile-time error
typedef B18<X extends A<A>>   = X Function(X);      //# 18: compile-time error
typedef B19<X extends A>      = X Function(X);      //# 19: compile-time error
typedef B20<X extends A<int>> = X Function(X);      //# 20: compile-time error

main() {
}
