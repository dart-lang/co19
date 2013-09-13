/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion EventTransformStream(Stream<S> source, StreamEventTransformer<S, T> transformer)
 * @description Checks that the transformer parameter is used.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class MyTransformer extends StreamEventTransformer<int, int> {
  int expected;
  int counter=0;
  
  MyTransformer(this.expected);
  
  void handleData(int event, EventSink<int> sink) {
    counter+=event;
    sink.add(event);
  }
  
  void handleDone(EventSink<int> sink) {
    Expect.equals(expected, counter);
    sink.close();
    asyncEnd();
  }
}

void check(Iterable it, var expectedLast, expectedSum) {
  Stream stream=new Stream.fromIterable(it);
  MyTransformer t=new MyTransformer(expectedSum);
  EventTransformStream ets=new EventTransformStream(stream, t);
  asyncMultiStart(2);
  ets.last.then((value){
    Expect.equals(expectedLast, value);
    asyncEnd();
  });
}

void main() {
  check([1,2,3], 3, 6);
  check(new Iterable.generate(10, (int index)=>2*index),
    18, 90
  );
}