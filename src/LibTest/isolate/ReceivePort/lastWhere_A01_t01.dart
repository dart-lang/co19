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
 * @description Checks that if element is found, it is passed to the resulting future.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

void check1(Iterable data, bool test(int element), var expected) {
  Stream s=new Stream.fromIterable(data);
  asyncStart();
  Future f=s.lastWhere(test);
  f.then((int actual){
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

void check2(Iterable data, bool test(int element), var expected) {
  Stream s=new Stream.fromIterable(data);
  asyncStart();
  Future f=s.lastWhere(
    test,
    defaultValue:(){
      Expect.fail("should not be called");
    }
  );
  f.then((int actual){
    Expect.equals(expected, actual);
    asyncEnd();
  });
}

void check(Iterable data, bool test(int element), var expected) {
  check1(data, test, expected);
  check2(data, test, expected);
}

main() {
  check([1,2,3], (int element)=>true, 3);
  check([1,2,3], (int element)=>element!=null, 3);
  check([1,2,3,null], (int element)=>element==null, null);
  check([1,2,3], (int element)=>element>0, 3);
  check(new Iterable.generate(10, (int index)=>index*5), (int element)=>element!=30, 45);
  check(new Iterable.generate(10, (int index)=>index*5), (int element)=>element==30, 30);
}
