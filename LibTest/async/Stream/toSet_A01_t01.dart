/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<Set<T>> toSet()
 * Collects the data of this stream in a Set.
 * @description Checks that returned set contains all elements of the stream.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(List data) {
  Stream s=new Stream.fromIterable(data);
  Future f=s.toSet();
  asyncStart();
  f.then((Set value){
      Expect.setEquals(data, value);
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

