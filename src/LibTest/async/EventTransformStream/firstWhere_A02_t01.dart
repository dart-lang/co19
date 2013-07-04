/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<dynamic> firstWhere(bool test(T element), {Object defaultValue()})
 * If no such element is found before this stream is done, and a defaultValue function is provided,
 * the result of calling defaultValue becomes the value of the future.
 * @description Checks that if this stream ends without finding a match and a defaultValue
 * function is provided, the result of calling defaultValue becomes the value of the future.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class MyTransformer extends StreamEventTransformer<int, int> {
}

void check(Iterable data, bool test(int element), int expected) {
  Stream s=new Stream.fromIterable(data);
  EventTransformStream ets=new EventTransformStream(s, new MyTransformer());
  asyncStart();
  Future f=ets.firstWhere(test, defaultValue: ()=>expected);
  f.then((bool actual){
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

main() {
  check([], (int element)=>true, 1);
  check([1,2,3], (int element)=>element==null, null);
  check(new Iterable.generate(0, (int index)=>index), (int element)=>false, 0);
  check(new Iterable.generate(0, (int index)=>index), (int element)=>true, 0);
  check(new Iterable.generate(10, (int index)=>index), (int element)=>false, 22);
  check(new Iterable.generate(10, (int index)=>index*5), (int element)=>element<0, 33);
}
