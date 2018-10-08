/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> skipWhile(bool test(T element))
 * Skip data events from this stream while they are matched by test.
 * Error and done events are provided by the returned stream unmodified.
 * Starting with the first data event where test returns true for the event data,
 * the returned stream will have the same events as this stream.
 * @description Checks that elements matched by a test are skipped.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

/** index - first position in the stream where test() returns false
 */
void check(List data, bool test(var element), int index) {
  Stream s=IsolateStream.fromIterable(data);
  Stream t=s.skipWhile(test);
  bool seen=false;
  asyncStart();
  t.listen((value){
      if (!seen) {
        Expect.isFalse(test(value), "test($value)=true");
        seen=true;
      } else {
        index++;
      }
      Expect.equals(data[index], value);
    },
    onDone: (){
      Expect.equals(seen, index<data.length);
      asyncEnd();
    }
  );
}

main() {
  check([],null,0);
  check([1,2,3], (element)=>false, 0);
  check([-1,-2,-3,1,2,3], (element)=>element<0, 3);
  check([1,2,3], (element)=>element==1, 1);
  check([1,2,3], (element)=>true, 3);
}

