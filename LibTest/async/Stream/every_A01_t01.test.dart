/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> every(bool test(T element))
 * Checks whether test accepts all elements provided by this stream.
 * Completes the Future when the answer is known.
 * @description Checks that correct answer is passed to the future.
 * @author kaigorodov
 */
library every_A01_t01;
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  AsyncExpect.value(true, create([]).every((var element) => true));
  AsyncExpect.value(true, create([1, 2, 3]).every((int e) => e != null));
  AsyncExpect.value(false, create([1, 2, 3, null]).every((int e) => e == null));
  AsyncExpect.value(true,
      create(new Iterable.generate(0, (int i) => i)).every((int e) => false));
  AsyncExpect.value(false,
      create(new Iterable.generate(10, (int i) => i)).every((int e) => false));
  AsyncExpect.value(true,
      create(new Iterable.generate(0, (int i) => i)).every((int e) => true));
  AsyncExpect.value(true,
      create(new Iterable.generate(2, (int i) => i)).every((int e) => true));
  AsyncExpect.value(false,
      create(new Iterable.generate(10, (int i) => i * 5)).every((int e) => e == 30));
  AsyncExpect.value(false,
      create(new Iterable.generate(10, (int i) => i * 5)).every((int e) => e != 30));
  AsyncExpect.value(true,
      create(new Iterable.generate(10, (int i) => i * 5)).every((int e) => e >= 0));
}
