/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Stream timeout(Duration timeLimit,
 *                           {void onTimeout(EventSink sink)})
 * Creates a new stream with the same events as this stream.
 *
 * Whenever more than timeLimit passes between two events from this stream, the
 * onTimeout function is called.
 *
 * The onTimeout function is called with one argument: an EventSink that allows
 * putting events into the returned stream. This EventSink is only valid during
 * the call to onTimeout.
 *
 * @description Check that if more than timeLimit passes between two events
 * from this stream, the onTimeout function is called with one argument: an
 * EventSink that allows putting events into the returned stream.
 * @author ngl@unipro.ru
 */
import "dart:async";
import "../../../Utils/expect.dart";

List<Completer> cl = [new Completer(), new Completer(), new Completer()];
List<int> cv = [1, 2, 3];
int i = 0;

void ontimeout(EventSink sink) {
  sink.add(cv[1]);
}

main() {
  Stream s1 = new Stream.fromIterable(
      [cl[0].future, cl[1].future, cl[2].future]);
  Stream s2 = s1.asyncMap((var event) => event);
  Stream s3 = s2.timeout(new Duration(microseconds: 1),
      onTimeout: ontimeout);

  asyncStart();
  s3.listen((var event) {
    Expect.isTrue(i < 2);
    Expect.equals(cv[i++], event);
    if (i == 2) {
      asyncEnd();
    }
  }, onError: (error) {
    Expect.fail("onError($error) called unexpectedly");
  }, onDone: () {
    Expect.fail("Listen was ended on timeout");
  });

  cl[0].complete(cv[0]);
  cl[2].complete(cv[2]);
}
