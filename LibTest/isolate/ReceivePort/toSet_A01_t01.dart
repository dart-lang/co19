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
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

void check(List data) {
  Stream s = IsolateStream.fromIterable(data);
  Future f = s.toSet();
  asyncStart();
  f.then((var value){
      Expect.setEquals(data, value);
      asyncEnd();
    });
}

main() {
  check([]);
  check([-1,-2,-3,1,2,3-1,-2,-3]);
  check([1,2,3]);
  check(["1",2,null]);
}
