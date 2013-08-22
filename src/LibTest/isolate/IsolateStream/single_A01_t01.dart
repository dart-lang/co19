/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Future<T> single
 * Returns the single element.
 * @description Checks that the single element is returned.
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(Iterable<int> data, int expected) {
  MessageBox mbox=new MessageBox();
  for (var element in data) {
    mbox.sink.add(element);
  }
  mbox.sink.close();
  
  asyncStart();
  mbox.stream.single.then((value){
    Expect.equals(expected, value);
    asyncEnd();
  });
}

main() {
  check([123], 123);
  check(new Iterable.generate(1, (int index)=>9), 9);
}
