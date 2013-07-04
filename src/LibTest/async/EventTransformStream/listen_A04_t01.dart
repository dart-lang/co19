/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamSubscription<T> listen(void onData(T event), {void onError(error), void onDone(), bool cancelOnError})
 * If cancelOnError is true, the subscription is ended when the first error is reported.
 * The default is false.
 * @description Checks that if cancelOnError is true, the subscription is ended when the first error.
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
  var expected = data[0];
  Stream s1=new Stream.fromIterable(data);

  // make a Stream with only error events
  EventTransformStream s2=new EventTransformStream(s1, new MyTransformer());

  Object firstError;
  bool firstErrorSeen=false;
  
  asyncStart();
  s2.listen((var event) {
      Expect.fail("unexpected call to onData($event)");
    },
    onError:(Object error) {
      Expect.isFalse(firstErrorSeen);
      firstErrorSeen=true;
      firstError=error;
    },
    onDone:() {
      Expect.equals(expected, firstError.message);
      asyncEnd();
    },
    cancelOnError: true
  );
}

main() {
  check([1,2,3,4]);
  check([null,"2",-3,4.0, []]);
}
