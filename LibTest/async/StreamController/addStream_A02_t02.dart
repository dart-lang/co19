/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future addStream(Stream<T> source, {bool cancelOnError: true})
 * Events must not be added directly to this controller using add, addError,
 * close or addStream, until the returned future is complete.
 *
 * @description Checks that events can be added when the returned future is
 * complete.
 * @author ilya
 */
import "dart:async";
import "../../../Utils/expect.dart";

listen(Stream stream, List expectedData, List expectedErrors) {
  List actualData = [];
  List actualErrors = [];

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
      }
  );
}

main() {
  StreamController c = new StreamController();

  listen(c.stream, [1, 2, 3, 4, 5, 6, 7], [0]);

  asyncStart();
  c.addStream(new Stream.fromIterable([1, 2, 3])).then((_) {
    c.add(4);
    c.addStream(new Stream.fromIterable([5, 6, 7])).then((_) {
      c.addError(0);
      c.close();
      asyncEnd();
    });
  });
}
