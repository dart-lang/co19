/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future addStream(Stream<S> stream)
 * @description Checks that all data and error events from stream are added.
 * @author ilya
 * @issue 14334
 */

import "dart:async";
import "../../../Utils/async_utils.dart";
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
        print(x);
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

  listen(c.stream, [1,3,5], [2,4]);

  asyncStart();
  sink.addStream(from).then((_) {
    c.close();
    asyncEnd();
  });
}
