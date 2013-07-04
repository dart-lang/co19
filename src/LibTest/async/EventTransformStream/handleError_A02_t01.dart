/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> handleError(void handle(error), {bool test(error)})
 * If test is omitted, every error is considered matching.
 * @description Checks that if test is omitted, every error is considered matching.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class MyTransformer extends StreamEventTransformer<int, int> {
  void handleData(int event, EventSink<int> sink) {
     throw new ArgumentError(event);
  }
}

void check(List data) {
  Stream s1=new Stream.fromIterable(data);

  // make a Stream with error events
  EventTransformStream s2=new EventTransformStream(s1, new MyTransformer());

  // intercept error events, do not (re)throw
  List sink=new List();
  Stream s3=s2.handleError((var error){
       sink.add(error.message);
    }); 

  asyncStart();
  s3.listen((var event) {
      Expect.fail("unexpected call to onData($event)");
    },
    onError:(Object error) {
      Expect.fail("unexpected call to onError($error)");
    },
    onDone:() {
      Expect.listEquals(data, sink);
      asyncEnd();
    }
  );
}

main() {
  check([]);
  check([1,2,3,4]);
  check([null,"2",-3,4.0, []]);
}
