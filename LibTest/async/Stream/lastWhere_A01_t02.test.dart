/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future lastWhere(bool test(T element), {Object defaultValue()})
 * Finds the last element in this stream matching test.
 * As firstWhere, except that the last matching element is found.
 * That means that the result cannot be provided before this stream is done.
 * @description Checks that if element is found, it is passed to the resulting
 * future. [defaultValue] is provided.
 * @author a.semenov@unipro.ru
 */
library lastWhere_A01_t02;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream s, bool test(int element), Object expected) {
  bool defaultValueCalled = false;
  asyncStart();
  s.lastWhere(test, defaultValue:() {defaultValueCalled = true;})
   .then((int actual){
     Expect.equals(expected, actual);
     Expect.isFalse(defaultValueCalled);
     asyncEnd();
   });
}

void test(CreateStreamFunction create) {
  check(create([1, 2, 3]), (int element) => true, 3);
  check(create([1, 2, 3]), (int element) => element != null, 3);
  check(create([1, 2, 3, null]), (int element) => element == null, null);
  check(create([1, 2, 3]), (int element) => element > 0, 3);
  check(create(new Iterable.generate(10, (int index) => index * 5)),
      (int element) => element != 30, 45);
  check(create(new Iterable.generate(10, (int index) => index * 5)),
      (int element) => element == 30, 30);
}
