/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Stream.fromFutures(Iterable<Future<T>> futures)
 * Create a stream from a group of futures.
 * . . .
 * If some futures have completed before calling Stream.fromFutures, their
 * result will be output on the created stream in some unspecified order.
 *
 * When all futures have completed, the stream is closed.
 *
 * @description Checks that if one future has completed before calling
 * Stream.fromFutures, their result will be output on the created stream in
 * some unspecified order. The stream is closed when all futures completed.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

const N = 4;

List<Completer> completers = new List<Completer>(N);
List<Future> futures = new List<Future>(N);
int num = 0;

main() {
  for (int k = 0; k < N; k++) {
    completers[k] = new Completer();
    futures[k] = completers[k].future;
  }
  completers[1].complete(1);

  Stream s = new Stream.fromFutures(futures);
  List<int> events = [];
  asyncStart();

  s.listen(
    (var event) {
      events.add(event);
    },
    onError: (_) {
      Expect.fail("onError called unexpectedly");
    },
    onDone: () {
      events.sort();
      Expect.listEquals([0,1,2,3], events);
      asyncEnd();
    }
  );

  for (int k = 0; k < N; k++) {
    if (k != 1) {
      completers[k].complete(k);
    }
  }
}
