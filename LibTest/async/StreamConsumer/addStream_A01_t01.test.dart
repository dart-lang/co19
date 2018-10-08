/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future addStream(Stream<S> stream)
 * Consumes the elements of stream.
 *
 * Listens on stream and does something for each event.
 *
 * Returns a future which is completed when the stream is done being added, and
 * the consumer is ready to accept a new stream.
 *
 * @description Checks the addStresm method.
 * @author ngl@unipro.ru
 */
library addStream_A01_t01;
import "dart:async";
import "../../../Utils/expect.dart";

test(StreamConsumer create()) {
  StreamConsumer sc1 = create();
  if (sc1 is StreamController) {
    StreamController sc = sc1;
    List values = [1, 2, 3, 4, 5, 6];
    int i = 0;

    sc.stream.listen((value) {
      Expect.equals(values[i++], value);
    },
    onError: (error) {
      Expect.fail("Unexpected error: $error");
    },
    onDone: () {
      asyncEnd();
    });

    asyncStart();
    sc1.addStream(new Stream.fromIterable([1, 2, 3])).then((_) {
      sc1.addStream(new Stream.fromIterable([4, 5, 6])).then((_) {
        sc1.close();
      });
    });
  }
}

