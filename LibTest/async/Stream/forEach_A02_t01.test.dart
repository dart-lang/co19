/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future forEach(void action(T element))
 * Completes the future with an error if the stream has an error event, or if
 * action throws.
 * @description Checks that the future is completed with error if the stream has
 * an error event.
 * @author kaigorodov
 */
library forEach_A02_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream s, Object expectedError) {
  asyncStart();
  s.forEach((var element) {}).then(
    (_) {
      Expect.fail("Returned future should copmlete with error");
    },
    onError: (Object error){
      Expect.equals(expectedError, error);
      asyncEnd();
    }
  );
}

void test(Stream<T> create(Iterable<T> data, {bool isError(T x)})) {
  check(create([1, 2, 3, 4], isError:(v) => v==4), 4);
  List list = [];
  check(create([null, "2", -3, 4.0, list], isError:(v) => v==list), list);
  check(create([null, "2", -3, 4.0, list], isError:(v) => v==4.0), 4.0);
}
