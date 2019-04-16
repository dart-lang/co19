/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A generic type alias is a declaration [D] of one of the following
 * forms:
 *    m typedef id<X1extendsB1, ..., Xs extendsBs> = T;
 * ...
 * where [m] is derived from metadata, [T] is a type, and [S?] is a type or the
 * empty string. Let [S0] be [S?] if it is a type, otherwise let [S0] be
 * [dynamic]. The associated type of [D], call it [F], is, respectively:
 *   T
 * ...
 * @description Checks that [T] should be a type.
 * @author iarkh@unipro.ru
 */

my_function<T>() {}

class C1<T> {
  C1(T i) {}
}

class C2<T> {
  C2(int, [T j]) {}
}

class C3<T1, T2> {
  C3({T1 i, T2 j}) {}
}

typedef Alias1<T> = my_function;            //# 01: compile-time error
typedef Alias2<T> = my_function<T>;         //# 02: compile-time error
typedef Alias3<T> = my_function();          //# 03: compile-time error
typedef Alias4<T> = my_function<T>();       //# 04: compile-time error

typedef CAlias1<T> = C1<T>(T);              //# 05: compile-time error
typedef CAlias2<T> = C2<T>(int, [T]);       //# 06: compile-time error
typedef CAlias3<T1, T2> = C3<T>({T1, T2});  //# 07: compile-time error

typedef CAlias4<T extends int> = C1<T>(24); //# 08: compile-time error

main() {}
