/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<dynamic> firstWhere(bool test(T element), {Object defaultValue()})
 * Finds the first element of this stream matching test.
 * Returns a future that is filled with the first element of this stream that test returns true for.
 * @description Checks that if element is found, it is passed to the resulting future.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class MyTransformer extends StreamEventTransformer<int, int> {
}

void check1(Iterable data, bool test(int element), var expected) {
  Stream s=new Stream.fromIterable(data);
  EventTransformStream ets=new EventTransformStream(s, new MyTransformer());
  asyncStart();
  Future f=ets.firstWhere(test);
  f.then((var actual){
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

void check2(Iterable data, bool test(int element), var expected) {
  Stream s=new Stream.fromIterable(data);
  asyncStart();
  Future f=s.firstWhere(
    test,
    defaultValue:(){
      Expect.fail("should not be called");
    }
  );
  f.then((bool actual){
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

void check(Iterable data, bool test(int element), var expected) {
  check1(data, test, expected);
//  check2(data, test, expected);
}

main() {
  check([1,2,3], (int element)=>true, 1);
  check([1,2,3], (int element)=>element!=null, 1);
  check([1,2,3,null], (int element)=>element==null, null);
  check([1,2,3], (int element)=>element>2, 3);
  check(new Iterable.generate(10, (int index)=>index*5), (int element)=>element!=30, 0);
  check(new Iterable.generate(10, (int index)=>index*5), (int element)=>element==30, 30);
}
