/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future forEach(void action(T element))
 * Completes the future with an error if the stream has an error event, or if action throws.
 * @description Checks that the future is completed with error if the stream has an error event.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class MyTransformer extends StreamEventTransformer<int, int> {
}

void check(Iterable it, var errValue) {
  Stream s1=new Stream.fromIterable(it);
  // make a Stream with error events
  Stream s2=s1.where((var event){
       if (event==errValue) {
         throw new Error();
       }
       return true;
    }); 
  EventTransformStream ets=new EventTransformStream(s2, new MyTransformer());
  asyncStart();
  Future f=ets.forEach((var element){});
  f.then((bool value){
      Expect.fail("unexpected call to onValue($value)");
    },
    onError:(Object error){
      asyncEnd();
    }
  );
}

main() {
  check([1,2,3,4], 4);
  List l=[];
  check([null,"2",-3,4.0, l], l);
}
