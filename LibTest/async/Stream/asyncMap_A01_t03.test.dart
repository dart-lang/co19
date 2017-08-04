/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Stream asyncMap(dynamic convert(T event))
 * Creates a new stream with each data event of this stream asynchronously
 * mapped to a new event.
 *
 * This acts like map, except that convert may return a Future, and in that
 * case, the stream waits for that future to complete before continuing with
 * its result.
 *
 * @description Checks that if convert return a Future, the stream waits for
 * that future to complete before continuing with its result.
 * @author ngl@unipro.ru
 */
library asyncMap_A01_t03;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(Stream<T> s1, List<T> expected) {
  List sink = new List();
  int len = expected.length;
  List<Completer> c = new List.generate(len, (_) => new Completer());
  int i = 0;

  asyncStart();
  Stream s2 = s1.asyncMap((event) => c[i++].future);
  s2.listen(
    (event) {
      sink.add(event);
    },
    onDone: () {
      Expect.listEquals(expected, sink);
      asyncEnd();
    }
  );

  for (int k = 0; k < len; k++) {
    c[k].complete(expected[k]);
  }
}

void test(Stream<T> create(Iterable<T> data)) {
  check(create([]), []);
  check(create([1, 2, 3, 4]), [1, 2, 3, 4]);
  check(create([null, "2", -3, 4.0, []]), [null, "2", -3, 4.0, []]);
}
