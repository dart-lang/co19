/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void handleError(error, EventSink<T> sink)
 * Act on incoming error event.
 * The method may generate any number of events on the sink, but should not throw.
 * @description Checks that the method may generate any number of events.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class MyTransformer extends StreamEventTransformer<int, int> {
  int value=1;
  void handleData(int value, EventSink<int> sink) {
    this.value=value;
  }
  void handleError(error, EventSink<int> sink) {
    for (int k=0; k<value; k++) {
      sink.add(error.message);
    }
  }
}

void check(List data, List expected) {
  Stream source = new Stream.fromIterable(data)
    .map( (x) => x>0?x:throw new ArgumentError(x) );
  MyTransformer transformer=new MyTransformer();
  List actual=new List();
  asyncStart();
  transformer.bind(source).listen((var value){
      actual.add(value);
    },
    onDone:() {
      Expect.listEquals(expected, actual);
      asyncEnd();
    }
  );
}

main() {
  check([],[]);
  check([2,-1],[-1,-1]);
  check([3,-2],[-2,-2,-2]);
}
