/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> contains(Object needle)
 * Checks whether needle occurs in the elements provided by this stream.
 * @description Checks that the method correctly checks whether match
 * occurs in the elements provided by this stream.
 * @author kaigorodov
 */

import "dart:isolate";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(List l, var match, bool expected) {
  MessageBox mbox=new MessageBox();

  Future<bool> fu=mbox.stream.contains(match);
  asyncStart();
  fu.then((actual){
    Expect.equals(expected, actual);
    asyncEnd();
  });

  for (var element in l) {
    mbox.sink.add(element);
  }
  mbox.sink.close();
}

main() {
  check([], null, false);
  check([1,2,[]], null, false);
  check([1,2,null,[]], null, true);
  check([1,2,[]], 4, false);
  check([1,2,null,[]], 2, true);
}

