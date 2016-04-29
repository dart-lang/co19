/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future forEach(Iterable input, Future f(element))
 * Returns a Future that completes when all elements have been processed.
 * @description Checks that returned future completes when all elements have
 * been processed.
 * @author kaigorodov
 */
import "../../../Utils/async_utils.dart";

import "dart:async";

List input = [0,1,2,3,4];
int N = input.length;

main() {
  List<Completer> completers = new List<Completer>(N);
  Future f;

  for (int k = 0; k < N; k++) {
    completers[k] = new Completer();
  }

  Future ff(int element) {
    return completers[element].future;
  }

  f = Future.forEach(input, ff);

  f.then((fValue) {
    asyncEnd();
  });

  // complete the futures in reverse order
  asyncStart();
  for (int k = N - 1; k >= 0; k--) {
    completers[k].complete(k);
  }
}

