/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future addStream(Stream<S> stream)
 * Consumes the elements of stream.
 *
 * No further calls to addStream or close should happen before the returned
 * future has completed.
 *
 * @description Checks that no further calls to addStream or close should
 * happen before the returned future has completed.
 * @author ngl@unipro.ru
 */
library addStream_A02_t01;
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
      if (i == 3) {
        asyncEnd();
      }
    },
    onError: (error) {
      Expect.fail("Unexpected error: $error");

    },
    onDone: () {
    });

    asyncStart();
    sc1.addStream(new Stream.fromIterable([1, 2, 3]));
    try {
      sc1.addStream(new Stream.fromIterable([4, 5, 6]));
    } catch (e) {
      Expect.isTrue(e is Error);
    }
    try {
      sc1.close();
    } catch (e) {
      Expect.isTrue(e is Error);
    }
  }
}

