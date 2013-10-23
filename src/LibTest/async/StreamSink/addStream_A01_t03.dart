/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Future addStream(Stream<S> stream)
 * @description Checks that addStream() can be preceded by add() and addError().
 * @author ilya
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
        actualErrors.add(x);
      },
      onDone: () {
        Expect.listEquals(expectedData, actualData);
        Expect.listEquals(expectedErrors, actualErrors);
        asyncEnd();
      });
}

main() {
  var from = new Stream.fromIterable([5,6]);

  var c = new StreamController();
  var sink = c.sink;

  listen(c.stream, [1,3,5,6], [2,4]);

  sink.add(1);
  sink.addError(2);
  sink.add(3);
  sink.addError(4);

  asyncStart();
  sink.addStream(from).then((_) {
    c.close();
    asyncEnd();
  });
}
