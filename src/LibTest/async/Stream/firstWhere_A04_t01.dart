/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> firstWhere(bool test(T element), {T defaultValue()})
 * Finds the first element of this stream matching test.
 * Returns a future that is filled with the first element of this stream that test returns true for.
 * If no such element is found before this stream is done, and a defaultValue function is provided,
 * the result of calling defaultValue becomes the value of the future.
 * If an error occurs, or if this stream ends without finding a match and with no defaultValue function
 * provided, the future will receive an error.
 * @description Checks that if this stream ends without finding a match and with no defaultValue
 * function provided, the future will receive an error.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

check(Iterable data, bool test(int element), var expected) {
  Stream s=new Stream.fromIterable(data);
  asyncStart();
  s.firstWhere(test).then((bool actual){
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

main() {
  check([], (int element)=>true, true);
  check([1,2,3], (int element)=>element!=null, true);
  check([1,2,3,null], (int element)=>element==null, false);
  check(new Iterable.generate(0, (int index)=>index), (int element)=>false, true);
  check(new Iterable.generate(10, (int index)=>index), (int element)=>false, false);
  check(new Iterable.generate(0, (int index)=>index), (int element)=>true, true);
  check(new Iterable.generate(2, (int index)=>index), (int element)=>true, true);
  check(new Iterable.generate(10, (int index)=>index*5), (int element)=>element==30, false);
  check(new Iterable.generate(10, (int index)=>index*5), (int element)=>element!=30, false);
  check(new Iterable.generate(10, (int index)=>index*5), (int element)=>element>=0, true);
}
