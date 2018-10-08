/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future addStream(Stream<S> stream)
 * Consumes the elements of stream.
 * Listens on stream and does something for each event.
 * The consumer may stop listening after an error, or it may consume all the
 * errors and only stop at a done event.
 * @description Checks that addStream ends after the first error event from
 * stream by default (see StreamController's addStream).
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

listen(stream, expectedData, expectedErrors) {
  var actualData = [];
  var actualErrors = [];

  asyncStart();
  stream.listen(
      (x) {
        actualData.add(x);
      },
      onError: (x) {
        actualErrors.add(x);
      },
      onDone: () {
        Expect.listEquals(expectedData, actualData);
        Expect.listEquals(expectedErrors, actualErrors);
        asyncEnd();
      });
}

main() {
  var from = new Stream.fromIterable([1,2,3,4,5]);

  // odd numbers as data events, even numbers as error events
  from = from.map((x) => x.isOdd ? x : throw x);
      
  var c = new StreamController();
  var sink = c.sink;

  listen(c.stream, [1], [2]);

  asyncStart();
  sink.addStream(from).then((_) {
    c.close();
    asyncEnd();
  });
}
