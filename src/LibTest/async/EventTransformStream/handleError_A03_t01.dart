/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> handleError(void handle(error), {bool test(error)})
 * If the error is intercepted, the handle function can decide what to do with it.
 * It can throw if it wants to raise a new (or the same) error,
 * or simply return to make the stream forget the error.
 * @description Checks that an error is rethrown, it appears in the stream.
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

void check(List data, List expected) {
  Stream s1=new Stream.fromIterable(data);
  
  // make a Stream with error events
  EventTransformStream s2=new EventTransformStream(s1, new MyTransformer());

  // intercept error events, rethrow some of them (even)
  List sink=new List();
  Stream s3=s2.handleError((var error){
      var element=(error as ArgumentError).message;
      // only even elements matched 
      if ((element%2)==0) {
        throw error;
      }
    }
  ); 

  asyncStart();
  s3.listen((var event) {
      Expect.fail("unexpected call to onData($event)");
    },
    onError:(Object error) {
      var element=(error as ArgumentError).message;
      // odd elements forgot and should not appear 
      Expect.isTrue((element%2)==0);
      sink.add(element);
    },
    onDone:() {
      Expect.listEquals(expected, sink);
      asyncEnd();
    }
  );
}

main() {
  check([], []);
  check([1,2,3,4], [2,4]);
}
