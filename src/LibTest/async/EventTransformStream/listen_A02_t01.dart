/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion StreamSubscription<T> listen(void onData(T event), {void onError(error), void onDone(), bool cancelOnError})
 * Adds a subscription to this stream.
 * If onData is null, nothing happens.
 * @description Checks that onData can be null;
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class MyTransformer extends StreamEventTransformer<int, int> {
  void handleData(int event, EventSink<int> sink) {
    sink.add(event);
  }
}

void check(List data) {
  Stream s1=new Stream.fromIterable(data);
  EventTransformStream s2=new EventTransformStream(s1, new MyTransformer());
  asyncStart();
  StreamSubscription ss=s2.listen(null,
    onDone:(){
      asyncEnd();
    }
  ); 
}

main() {
  check([]);
  check([1,2,3,4]);
  check([null,"2",-3,4.0, []]);
}
