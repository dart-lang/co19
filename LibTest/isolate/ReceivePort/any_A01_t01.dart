/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> any(bool test(T element))
 * Checks whether test accepts any element provided by this stream.
 * Completes the Future when the answer is known.
 * @description Checks that correct answer is passed to the future.
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

check(Iterable<int> data, bool test(var element), bool expected) {
  ReceivePort s = IsolateStream.fromIterable(data);
  asyncStart();
  s.any(test).then((bool actual){
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

main() {
  check([], (element) => true, false);
  check([1,2,3], (element) => element == null, false);
  check([1, 2, 3, null], (element) => element == null, true);
  check(new Iterable.generate(0, (index) => index * 2), (element) => true, false);
  check(new Iterable.generate(10, (index) => index * 5), (element) => element==30, true);
}
