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
 * @description Checks that all error events are returned. Checks that 
 * the resulting stream ends with a done event.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";
import "IsolateStream.dart" as IsolateStream;

int eventCount=2; // the length of the source stream
int takeCount=2; // how many events to take

void main() {
  Iterable it=new Iterable.generate(eventCount, (int index)=>index);
  Stream s = IsolateStream.fromIterable(it).map((x) => throw new ArgumentError(x));
  Stream t=s.take(takeCount);
  asyncStart();
  t.listen((value){
      Expect.fail("onData call not expected");
    },
    onError: (error) {
      Expect.isTrue(error is ArgumentError);
    },
    onDone: () {
      asyncEnd();
    }
  );
}
