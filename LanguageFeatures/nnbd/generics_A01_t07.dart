 /*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The default bound of generic type parameters is treated as
 * [Object?].
 * @description Check that default function type parameter is treated as
 * [Object?].
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

import "../../Utils/expect.dart";

void test1<T>() {
  Expect.equals(Object?, T);
}

T test2<T>() {
  Expect.equals(Object?, T);
  return null;
}

void test3<T>(expected, [T t]) {
  Expect.equals(expected, T);
}

T test4<T>(expected, [T t]) {
  Expect.equals(expected, T);
  return null;
}

void test5<T1, T2, T3>() {
  Expect.equals(dynamic, T1);
  Expect.equals(dynamic, T2);
  Expect.equals(dynamic, T3);
}

void main() {
  test1();
  test2();
  test3(Object?);
  test3(Null, null);
  test4(Object?);
  test4(int, 45);
  test5();
}
