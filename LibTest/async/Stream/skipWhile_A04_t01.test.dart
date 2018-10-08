/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> skipWhile(bool test(T element))
 *    Skip data events from this stream while they are matched by [test].
 *    ...
 *    The test fails when called with a data event
 * if it returns a non-`true` value or if the call to `test` throws.
 * If the call throws, the error is emitted as an error event
 * on the returned stream instead of the data event,
 * otherwise the event that made `test` return non-true is emitted as the
 * first data event.
 * @description Checks that if [test] throws an error, then the error is
 * emitted as an error event on the returned stream and it is considered as
 * [test] failure.
 * @author a.semenov@unipro.ru
 */
library skipWhile_A04_t01;
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  AsyncExpect.data([], create([]).skipWhile((e) => throw "a"));
  AsyncExpect.events([2, 3], ["b"], create([1, 2, 3]).skipWhile((e) => throw "b"));
  AsyncExpect.events(
      [2, 3], // expected data
      ["c"],  // expected errors
      create([-1, -2, -3, 1, 2, 3]).skipWhile(
        (element) {
          if (element > 0) {
            throw "c";
          };
          return true;
        }
      )
  );
}
