/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> takeWhile(bool test(T element))
 * Forwards data events while test is successful.
 * The returned stream provides the same events as this stream as long as test
 * returns true for the event data.
 * The stream is done when either this stream is done, or when this stream first
 * provides a value that test doesn't accept.
 * @description Checks that only first elements that passed the test are returned.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

/** index - first position in the stream where test() returns false
 */
void check(List data, bool test(var element), int index) {
  Stream s=IsolateStream.fromIterable(data);
  Stream t=s.takeWhile(test);
  asyncStart();
  int seen = -1;
  t.listen((value){
      seen++;
      Expect.isTrue(test(value), "test($value)");
      Expect.isTrue(seen<index, "seen=$seen, index=$index");
      Expect.equals(data[seen], value);
    },
    onDone: (){
      Expect.equals(index, seen+1);
      if (index<data.length) {
        Expect.isFalse(test(data[index]));
      }
      asyncEnd();
    }
  );
}

main() {
  check([], null, 0);
  check([-1,-2,-3,1,2,3-1,-2,-3], (element)=>element<0, 3);
  check([1,2,3], (element)=>true, 3);
  check([1,2,3,1], (element)=>element==1, 1);
  check([1,2,3], (element)=>false, 0);
}

