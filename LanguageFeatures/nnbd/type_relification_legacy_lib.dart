/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// @dart=2.4

library type_relification_legacy_lib;

class A {}
class A1 extends A {}
class B<T> {}

typedef AliasA = A;

typedef F1 = int Function(A1);
typedef F2<X, Y, Z> = X Function<YY extends Y>(Z);
typedef F3<T> = void Function(T);
typedef F4<T> = T Function();

int test1(A1) { return 0; }
int test2(A) { return 1; }
void test3(A1) {}
int test4<B1 extends B>(A1 a) { return 2; }
int test5<T>(A a) { return 3; }
dynamic test6<T>(a) { return ""; }
int test7() {}


