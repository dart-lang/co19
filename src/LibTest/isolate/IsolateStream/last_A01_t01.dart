/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Future<T> last
 * Returns the last element.
 * @description Checks that the last element is returned.
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

const VAL=123;

check(Iterable<int> data, int expected) {
  MessageBox mbox=new MessageBox();
  for (var element in data) {
    mbox.sink.add(element);
  }
  mbox.sink.close();
  
  asyncStart();
  mbox.stream.last.then((actual) {
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

main() {
  check([1,2,3,null], null);
  check([1,2,3,123], 123);
  check(new Iterable.generate(10, (int index)=>index), 9);
}
