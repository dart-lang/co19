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
 * @description Checks that if all futures have completed before calling
 * Stream.fromFutures, their result will be output on the created stream in
 * some unspecified order. The stream is closed whem all futures completed.
 * @author ngl@unipro.ru
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

const N = 4;

List<Completer> completers = new List<Completer>(N);
List<Future> futures = new List<Future>(N);
int num = 0;


main() {
  for (int k = 0; k < N; k++) {
    completers[k] = new Completer();
    futures[k] = completers[k].future;
    completers[k].complete(k);
  }

  Stream s = new Stream.fromFutures(futures);

  asyncStart();

  s.listen((int event) {
    num++;
  }, onError: (_) {
    Expect.fail("onError called unexpectedly");
  }, onDone: () {
    Expect.equals(N, num, "onDone");
    asyncEnd();
  });

}

