/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<dynamic> lastWhere(bool test(T element), {Object defaultValue()})
 * Finds the last element in this stream matching test.
 * As firstWhere, except that the last matching element is found.
 * That means that the result cannot be provided before this stream is done.
 * @description Checks that if this stream ends without finding a match and with no defaultValue
 * function provided, the future will receive an error.
 * @author kaigorodov
 */
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

check(Iterable data, bool test(var element)) {
  Stream s = IsolateStream.fromIterable(data);
  asyncStart();
  s.lastWhere(test).then(
    (data) {
      Expect.fail("data passed: $data");
    },
    onError: (error) {
      Expect.isTrue(error is Error);
      asyncEnd();
    }
);
}

main() {
  check([], (var element) => true);
  check([1, 2, 3], (var element) => element == null);
  check([null, null], (var element) => element != null);
  check(new Iterable.generate(0, (int index) => index), (var element) => false);
  check(new Iterable.generate(10, (int index) => index), (var element) => false);
  check(new Iterable.generate(10, (int index) => index * 5), (var element) => element < 0);
  check(new Iterable.generate(10, (int index) => index * 5), (var element) => element == 300);
}
