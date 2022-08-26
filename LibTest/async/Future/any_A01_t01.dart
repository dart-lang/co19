// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion  Future any(Iterable<Future> futures)
/// Returns the result of the first future in futures to complete.
///
/// The returned future is completed with the result of the first future in
/// futures to report that it is complete. The results of all the other futures
/// are discarded.
///
/// If futures is empty, or if none of its futures complete, the returned future
/// never completes.
///
/// @description Checks that returned future is completed with the result of the
/// first future in the futures that is completed. The first future in futures
/// completed with 6 is element 0.
/// @author ngl@unipro.ru

import "dart:async";
import "../../../Utils/expect.dart";

const int N = 6;

main() {
  List<Future> futures = new List<Future>.filled(N, null);

  for (int k = 0; k < N; k++) {
    Completer c = new Completer();
    futures[k] = c.future;
    if (k == 0) {
      c.complete(6);
    }
    if (k == 1) {
      c.complete(true);
    }
    if (k == 2) {
      c.complete(false);
    }
    if (k == 3) {
      c.complete(null);
    }
  }

  Future f = Future.any(futures);

  asyncStart();
  f.then((fValue) {
    Expect.equals(fValue, 6);
    asyncEnd();
  });
}
