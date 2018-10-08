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

import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

check(List l, var match, bool expected) {
  Stream s=IsolateStream.fromIterable(l);
  Future<bool> fu=s.contains(match);
  asyncStart();
  fu.then((actual){
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

main() {
  check([], null, false);
  check([1,2,[]], null, false);
  check([1,2,null,[]], null, true);
  check([1,2,[]], 4, false);
  check([1,2,null,[]], 2, true);
}

