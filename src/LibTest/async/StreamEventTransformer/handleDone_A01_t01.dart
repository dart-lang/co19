/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void handleDone(EventSink<T> sink)
 * Act on incoming done event.
 * The method may generate any number of events on the sink, but should not throw.
 * @description Checks that the method may generate any number of events.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

class MyTransformer<int> extends StreamEventTransformer<int, int> {
  int value=1;
  void handleData(int value, EventSink<int> sink) {
    this.value=value;
  }
  void handleDone(EventSink<int> sink) {
    for (int k=0; k<value; k++) {
      sink.add(value);
    }
    sink.close();
  }
}

void check(List data, List expected) {
  Stream source = new Stream.fromIterable(data);
  MyTransformer transformer=new MyTransformer();
  List actual=new List();
  asyncStart();
  transformer.bind(source).listen((var value){
      actual.add(value);
    },
    onError: (error) {
      actual.add(error);
    },
    onDone:() {
      Expect.listEquals(expected, actual);
      asyncEnd();
    }
  );
}

main() {
  check([],[1]);
  check([1],[1]);
  check([2],[2,2]);
  check([2,3],[3,3,3]);
}
