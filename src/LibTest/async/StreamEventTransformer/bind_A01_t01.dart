/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream<T> bind(Stream<S> source)
 * Subscribing on the stream returned by bind is the same as subscribing on the source stream,
 * except that events are passed through the transformer before being emitted.
 * @description Checks that the new stream sends the same error and done events as this stream.
 * Checks that events are passed through the transformer before being emitted.
 * @author kaigorodov
 */

import "dart:async";
import "dart:collection";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void check(List data) {
  Stream source = new Stream.fromIterable(data)
    .map( (x) => x!=null?x:throw new ArgumentError(x) );

  List data1=new List();
  Queue events=new Queue();
  StreamTransformer myTransformer=new StreamTransformer (
    handleData: (var event, EventSink sink) {
      data1.add(event);
      events.add(event);
      sink.add(event);
    },
    handleError: (error, EventSink<int> sink) {
      data1.add(error);
      events.add(error);
      sink.addError(error);
    },
    handleDone:(EventSink<int> sink) {
      sink.close();
      asyncEnd();
    }
  );

  asyncStart();
  Stream s2=myTransformer.bind(source); // transformed stream
  
  List data2=new List(); // collected from transformed stream
  asyncStart();
  s2.listen((var value){
      Expect.equals(value, events.removeLast());
      data2.add(value);
    },
    onError: (error) {
      Expect.equals(error, events.removeLast());
      data2.add(error);
    },
    onDone:() {
      Expect.listEquals(data1, data2);
      asyncEnd();
    }
  );
}

main() {
//  check([]);
//  check([null]);
  check([1,2,3,4,"5",6.0, null]);
}
