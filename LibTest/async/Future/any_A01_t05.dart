/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  Future any(Iterable<Future> futures)
 * Returns the result of the first future in futures to complete.
 *
 * The returned future is completed with the result of the first future in
 * futures to report that it is complete. The results of all the other futures
 * are discarded.
 *
 * If futures is empty, or if none of its futures complete, the returned future
 * never completes.
 *
 * @description Checks that returned future is completed with the result of the
 * first future in the futures that is completed.
 * @author a.semenov@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

const int N = 6;

main() {
  List<Completer> completers = new List.generate(N, (_) => new Completer());
  Iterable<Future> futures = completers.map((Completer c) => c.future);
  Future f = Future.any(futures);
  f.then((value) {
    Expect.equals(value, "value");
    asyncEnd();
  });
  asyncStart();
  new Timer(durationMs(200), () => completers[3].complete("value"));
}
