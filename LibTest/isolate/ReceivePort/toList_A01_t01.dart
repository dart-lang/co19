/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<List<T>> toList()
 * Collects the data of this stream in a List.
 * @description Checks that returned list contains all elements of the stream in the same order.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

void check(List data) {
  Stream s=IsolateStream.fromIterable(data);
  Future f=s.toList();
  asyncStart();
  f.then((value){
      Expect.listEquals(data, value);
      asyncEnd();
    });
}

main() {
  check([]);
  check([-1,-2,-3,1,2,3-1,-2,-3]);
  check([1,2,3]);
  check([[],[[]],[[[]]]]);
  check(["1",2,null]);
}

