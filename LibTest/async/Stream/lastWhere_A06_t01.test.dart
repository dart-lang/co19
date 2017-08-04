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
 * @description Checks that if [defaultValue] throws error, the returned future will
 * receive this error.
 * @author a.semenov@unipro
 */
library lastWhere_A06_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void test(Stream<T> create(Iterable<T> data)) {
  Stream s = create([1,2,3]);
  asyncStart();
  s.lastWhere((e) => false, defaultValue:() => throw "z").then(
    (data) {
      Expect.fail("Returned future should complete with error");
    },
    onError: (error) {
      Expect.equals("z", error);
      asyncEnd();
    }
  );
}
