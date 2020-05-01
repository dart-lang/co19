/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
// @dart=2.6

library type_reification_legacy_lib;

class A            {}
class A1 extends A {}
class B<T>         {}

typedef F1 = int Function(A1 a);
typedef F2<X, Y, Z> = X Function<YY extends Y>(Z z);
typedef F3<T> = void Function(T t);
typedef F4<T> = T Function();

int test1(A1) => 0;
int test2(A) => 1;
void test3(A1) {}
int test4<B1 extends B>(A1 a) => 2;
int test5<T>(A a) => 3;
dynamic test6<T>(a) => "";
int test7() => 1;
