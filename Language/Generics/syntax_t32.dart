// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A generic type alias is a declaration [D] of one of the following
/// forms:
///    m typedef id<X1extendsB1, ..., Xs extendsBs> = T;
/// ...
/// where [m] is derived from metadata, [T] is a type, and [S?] is a type or the
/// empty string. Let [S0] be [S?] if it is a type, otherwise let [S0] be
/// [dynamic]. The associated type of [D], call it [F], is, respectively:
///   T
/// ...
/// @description Checks that it is a syntax error if [T] is a [Function] in a
/// wrong form
/// @author iarkh@unipro.ru

class A {
  static int callme() => 25;
}

int getme() => 0;

typedef WAlias1<T> = A() Function(T);                 //# 01: syntax error
typedef WAlias2<T, T2, T3> = A.callme() Function(T);  //# 02: syntax error
typedef WAlias5<T> = getme() Function(T, int, [int]); //# 03: syntax error

main() {}
