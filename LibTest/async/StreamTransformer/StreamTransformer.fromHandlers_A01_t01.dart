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
 * @description Checks that constructor with no arguments can be used, in which
 * case transformed stream gets all events of source stream.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Stream<int> s = new Stream.fromIterable([1,2,3,4,5]);
  
  // odd numbers as data events, even numbers as error events
  s = s.map((x) => x.isOdd ? x : throw x);

  StreamTransformer<int, dynamic> tr = new StreamTransformer.fromHandlers();
  
  int data = 1;
  int error = 2;

  asyncStart();
  s.transform(tr).listen(
    (x) {
      Expect.equals(data, x);
      data += 2;
    },
    onError:(x) {
      Expect.equals(error, x);
      error += 2;
    },
    onDone:() {
      asyncEnd();
    }
  );
}
