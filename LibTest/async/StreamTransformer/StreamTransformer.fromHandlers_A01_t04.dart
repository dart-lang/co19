/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory StreamTransformer.fromHandlers({void handleData(S data,
 *   EventSink<T> sink), void handleError(Object error, StackTrace stackTrace,
 *   EventSink<T> sink), void handleDone(EventSink<T> sink)})
 * Creates a StreamTransformer that delegates events to the given functions.
 *
 * @description Checks the case when all handlers are provided, errors
 * converted to data, and handleDone() adds extra data elements.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Stream<int> s = new Stream.fromIterable([1, 2, 3, 4, 5]);
  
  // odd numbers as data events, even numbers as error events
  s = s.map((x) => x.isOdd ? x : throw x);

  StreamTransformer<int, dynamic> tr = new StreamTransformer.fromHandlers(
      handleData: (x, sink) { sink.add(x); },
      handleError: (x, st, sink) { sink.add(x); },
      handleDone: (sink) { sink.add(6); sink.add(7); sink.close(); }
  );
  
  asyncStart();
  s.transform(tr).toList().then(
    (x) {
      Expect.listEquals([1, 2, 3, 4, 5, 6, 7], x);
      asyncEnd();
    }
  );
}
