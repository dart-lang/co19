// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  Stream.fromFutures(Iterable<Future<T>> futures)
/// Create a stream from a group of futures.
///
/// The stream reports the results of the futures on the stream in the order in
/// which the futures complete.
///
/// @description Checks that the stream reports the results of the futures on the
/// stream in the order in which the futures complete. Check serial order.
/// @author ngl@unipro.ru

import "dart:async";
import "../../../Utils/expect.dart";

const N = 4;

List<Completer> completers = new List<Completer>.filled(N, new Completer());
List<Future> futures = new List<Future>.filled(N, new Future.value());
int num = 0;

main() {
  for (int k = 0; k < N; k++) {
    completers[k] = new Completer();
    futures[k] = completers[k].future;
  }

  Stream s = new Stream.fromFutures(futures);

  asyncStart();

  s.listen((var event) {
    Expect.equals(num++, event);
  }, onError: (_) {
    Expect.fail("onError called unexpectedly");
  }, onDone: () {
    Expect.equals(N, num, "onDone");
    asyncEnd();
  });

  for (int k = 0; k < N; k++) {
    completers[k].complete(k);
  }
}
