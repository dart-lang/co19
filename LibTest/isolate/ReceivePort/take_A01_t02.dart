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

void check(int eventCount, int takeCount, int expectedErrorCount) {
  Iterable it=new Iterable.generate(eventCount, (int index)=>index);
  Stream s = IsolateStream.fromIterable(it).map((x) => throw new ArgumentError(x));
  Stream t=s.take(takeCount);
  int seenCount=0;
  asyncStart();
  t.listen((value){
      Expect.fail("datum not expected");
    },
    onError: (error) {
      Expect.isTrue(error is ArgumentError, error.toString());
      var message=(error as ArgumentError).message;
      Expect.equals(seenCount, message);
      seenCount++;
    },
    onDone: () {
      Expect.equals(expectedErrorCount, seenCount);
      asyncEnd();
    }
  );
}

main() {
  check(0, 0, 0);
  check(0, 1, 0);
  check(1, 0, 0); // see issue https://github.com/dart-lang/co19/issues/81 for details
  check(1, 1, 1);
  check(2, 3, 2);
  check(3, 2, 3);
}

