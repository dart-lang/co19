/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A generic type alias is a declaration [D] of one of the following
 * forms:
 * ...
 *   m typedef S? id<X1extendsB1, ..., Xs extendsBs>(
 *     T1 p1, ..., Tn pn, [Tn+1 pn+1, ..., Tn+k pn+k]);
 *   m typedef S? id<X1extendsB1, ..., Xs extendsBs>(
 *     T1 p1, ..., Tn pn, {Tn+1 pn+1, ..., Tn+k pn+k});
 * where [m] is derived from metadata, [T] is a type, and [S?] is a type or the
 * empty string.
 * @description Checks that [S] can be empty string or type.
 * @author iarkh@unipro.ru
 */

class A {
  static int callme() {
    return 25;
  }
}

int getme() { return 0; }
int i = 5;
String str = "test";

typedef Alias1<T> = Function(T);
typedef Alias2<T, T2, T3> = int Function(T);
typedef Alias3<T> = Alias1 Function(T, int, [int]);
typedef Alias4<T> = void Function(T, int, {int i, T t, num n});

typedef WAlias1<T> = A() Function(T);                 //# 01: compile-time error
typedef WAlias2<T, T2, T3> = A.callme() Function(T);  //# 02: compile-time error
typedef WAlias3<T> = A.callme Function(T, int, [int]);//# 03: compile-time error
typedef WAlias4<T> = getme Function(T, int, [int]);   //# 04: compile-time error
typedef WAlias5<T> = getme() Function(T, int, [int]); //# 05: compile-time error
typedef WAlias6<T> = i Function(T, int, [int]);       //# 06: compile-time error
typedef WAlias7<T> = str Function(T, int, [int]);     //# 07: compile-time error

main() {}
