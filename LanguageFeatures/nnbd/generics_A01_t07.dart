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
 * @Issue 40367
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
 // Requirements=nnbd-strong

import "../../Utils/expect.dart";

dynamic i = null;

void test1<T>() {
  Expect.equals(typeOf<Object?>(), T);
}

T test2<T>() {
  Expect.equals(typeOf<Object?>(), T);
  return i;
}

void test3<T>(T t) {
  Expect.equals(typeOf<Object?>(), T);
}

T test4<T>(T t) {
  Expect.equals(typeOf<Object?>(), T);
  return i;
}

void test5<T1, T2, T3>() {
  Expect.equals(typeOf<Object?>(), T1);
  Expect.equals(typeOf<Object?>(), T2);
  Expect.equals(typeOf<Object?>(), T3);
}

void main() {
  test1();
  test2();
  test3(1);
  test4(11);
  test5();
}
