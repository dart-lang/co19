/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> contains(T match)
 * Completes the Future when the answer is known.
 * @description Checks that the Future is completed when the answer is known.
 * @author kaigorodov
 * @note if check
 */

import "dart:async";
import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(List l, var match, int expected) {
  Iterator it=l.iterator;
  MessageBox mbox=new MessageBox();
  Future<bool> fu=mbox.stream.contains(match);
  int count=0;
  
  asyncStart();
  fu.then((actual) {
    Expect.equals(expected, count);
    asyncEnd();
  });

  while (it.moveNext() && (count<expected)) {
    count++;
    mbox.sink.add(it.current);
  }
  mbox.sink.close();
}

main() {
  check([], null, 0);
  check([1,2,[]], null, 3);
  check([1,2,null,[]], null, 3);
  check([1,2,[],"z",4], "z", 4);
  check([1,2,null,[]], 2, 2);
}

