/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamSubscription<T> listen(void onData(T event),
 *   {Function onError, void onDone(), bool cancelOnError})
 * On errors from this stream, the onError handler is given a object describing
 * the error.
 * @description Checks that the onError handler is given an object describing the
 * error.
 * @author kaigorodov
 */
library listen_A03_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, List<T> data, List errors) {
  List<T> dataSink = [];
  List errorSink = [];
  asyncStart();
  s.listen(
    (T event) {
      dataSink.add(event);
    },
    onError: (Object error) {
       errorSink.add(error);
    },
    onDone: () {
      Expect.listEquals(data, dataSink);
      Expect.listEquals(errors, errorSink);
      asyncEnd();
    }
  );
}

void test(CreateStreamWithErrorsFunction create) {
  check(create([]), [], []);
  check(create([1, 2, 3, 4], isError:(x) => false), [1, 2, 3, 4], []);
  check(create([1, 2, 3, 4], isError:(x) => true), [], [1, 2, 3, 4]);
  check(create([1, 2, 3, 4], isError:(x) => x.isOdd), [2, 4], [1,3]);
  check(
      create([null, "2", -3, 4.0, []], isError:(x) => x is num),
      [null, "2", []],
      [-3, 4.0]
  );
}
