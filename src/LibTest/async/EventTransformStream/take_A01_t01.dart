/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> take(int count)
 * Provides at most the first n values of this stream.
 * Forwards the first n data events of this stream, and all error events,
 * to the returned stream, and ends with a done event.
 * If this stream produces fewer than count values before it's done,
 * so will the returned stream.
 * @description Checks that at most n elements are returned.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class MyTransformer extends StreamEventTransformer {
  void handleData(var event, EventSink sink) {
    sink.add(event);
  }
}

void check(List data, int count) {
  Stream s=new Stream.fromIterable(data);
  EventTransformStream ets=new EventTransformStream(s, new MyTransformer());
  Stream t=ets.take(count);
  int seen=0;
  asyncStart();
  t.listen((value){
      Expect.isTrue(seen<count, "seen=$seen, count=$count");
      Expect.equals(data[seen], value);
      seen++;
    },
    onDone: (){
      asyncEnd();
    }
  );
}

main() {
  check([],0);
  check([],1);
  check([],10);
  check([null], 0);
  check([null], 1);
  check([null], 2);
  check([1,2,3], 0);
  check([1,2,3], 1);
  check([1,2,3], 2);
  check([1,2,3], 12);
  check([[],[[]],[[[]]]], 2);
}

