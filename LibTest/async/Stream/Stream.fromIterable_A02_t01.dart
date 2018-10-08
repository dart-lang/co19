/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream.fromIterable(Iterable<T> data)
 * If iterating data throws an error, the stream ends immediately with that
 * error. No done event will be sent (iteration is not complete), but no
 * further data events will be generated either, since iteration cannot
 * continue.
 * @description Checks that if iterating throws an error, onError callback
 * is run with this error. Also checks that data events are neither further
 * generated nor fired and onDone event does not happen.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/expect.dart";

int f(int i) {
  if (i < 5)
    return i;
  if (i == 5)
    throw i;
  if (i > 5)
    Expect.fail('data generation did not stop');
}

main() {
  Iterable<int> it = new Iterable<int>.generate(10, (int i) => f(i));
  Stream<int> s = new Stream<int>.fromIterable(it);
  List events = [];
  asyncStart();

  s.listen(
    (int x) {
      events.add(x);
    },
    onError: (error) {
      events.add(error);
      // wait some time for additional (wrong) events
      new Future.delayed(durationMs(500), () {
        Expect.listEquals([0,1,2,3,4,5], events);
        asyncEnd();
      });
    },
    onDone: () {
      events.add("done");
    }
  );
}
