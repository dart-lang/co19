/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> any(bool test(T element))
 * Checks whether test accepts any element provided by this stream.
 * Completes the Future when the answer is known.
 * @description Checks that Future completes when the first matching element
 * is encounterd.
 * @author ilya
 */

import "dart:async";
import "dart:isolate";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

main() {
  int count = 0;
  int first = 0;
  bool encountered = false;
  bool test(var element) {
     bool res = element % 10 == 0;
     if (res && !encountered) {
       encountered = true;
       first = element;
     }
     return res;
  }
  asyncStart();
  ReceivePort stream = IsolateStream.fromIterable(new Iterable.generate(100, (_) => ++count));
  Future<bool>  f = stream.any(test);
  f.then((x) {
      Expect.isTrue(x);
      Expect.isTrue(encountered);
      Expect.equals(10, first);
      asyncEnd();
  });
}

