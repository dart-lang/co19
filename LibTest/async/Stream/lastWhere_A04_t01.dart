/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<dynamic> lastWhere(bool test(T element), {Object defaultValue()})
 * Finds the last element in this stream matching test.
 * As firstWhere, except that the last matching element is found.
 * That means that the result cannot be provided before this stream is done.
 * @description Checks that if this stream ends without finding a match and with no defaultValue
 * function provided, the future will receive an error.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(Iterable data, bool test(int element)) {
  Stream s=new Stream.fromIterable(data);
  asyncStart();
  s.lastWhere(test).then(
    (data) {
      Expect.fail("data passed: $data");
    },
    onError: (error) {
      Expect.isTrue(error is Error);
      asyncEnd();
    }
);
}

main() {
  check([], (int element)=>true);
  check([1,2,3], (int element)=>element=null);
  check([null,null], (int element)=>element!=null);
  check(new Iterable.generate(0, (int index)=>index), (int element)=>false);
  check(new Iterable.generate(10, (int index)=>index), (int element)=>false);
  check(new Iterable.generate(10, (int index)=>index*5), (int element)=>element<0);
  check(new Iterable.generate(10, (int index)=>index*5), (int element)=>element==300);
}
