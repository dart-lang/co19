/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Future<bool> isEmpty
 * Reports whether this stream contains any elements.
 * @description Checks that the method returns whether this stream contains any elements.
 * @author kaigorodov
 */

import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

check(Iterable<int> data, bool expected) {
  asyncStart();
  IsolateStream.fromIterable(data).isEmpty.then((bool actual) {
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

main() {
  check([], true);
  check([1,2,3,null], false);
  check(new Iterable.generate(0, (int index)=>1), true);
  check(new Iterable.generate(10, (int index)=>1), false);
}
