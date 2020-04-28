 /*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The default bound of generic type parameters is treated as
 * [Object?].
 *
 * @description It seems like it is not possible to obtain the value of the
 * default bound at runtime, we can only obtain the result of instantiation to
 * bound. So the test checks that if generic function type parameter is not
 * clearly specified, it is treated as [dynamic] at runtime.
 *
 * See also co19 issue #530.
 * @Issue 40367
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
 // Requirements=nnbd-strong

import "../../Utils/expect.dart";

dynamic i = null;

void test1<T>() {
  Expect.equals(typeOf<dynamic>(), T);
}

T test2<T>() {
  Expect.equals(typeOf<dynamic>(), T);
  return i;
}

void test3<T>(T t) {
  Expect.equals(typeOf<dynamic>(), T);
}

T test4<T>(T t) {
  Expect.equals(typeOf<int?>(), T);
  return i;
}

void test5<T1, T2, T3>() {
  Expect.equals(typeOf<dynamic>(), T1);
  Expect.equals(typeOf<dynamic>(), T2);
  Expect.equals(typeOf<dynamic>(), T3);
}

void main() {
  test1();
  test2();
  test3(1 as dynamic);
  test4(11 as int?);
  test5();
}
