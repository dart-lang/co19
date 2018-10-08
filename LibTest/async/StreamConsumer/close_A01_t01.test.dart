/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future close()
 * Tells the consumer that no further streams will be added.
 *
 * @description Checks that if consumer was closed, no streams can be added
 * after closing.
 * @author ngl@unipro.ru
 */
library close_A01_t01;
import "dart:async";
import "../../../Utils/expect.dart";

test(StreamConsumer create()) {
  StreamConsumer sc1 = create();
  if (sc1 is StreamController) {
    StreamController sc = sc1;
    List values = [1, 2, 3];
    int i = 0;

    sc.stream.listen((value) {
      Expect.equals(values[i++], value);
    },
    onError: (error) {
      Expect.fail("Unexpected error: $error");
    },
    onDone: () {
      Expect.equals(3, i);
      asyncEnd();
    });

    asyncStart();
    sc1.addStream(new Stream.fromIterable([1, 2, 3])).then((_) {
      sc1.close().then((_) {
        try {
          sc1.addStream(new Stream.fromIterable([4, 5, 6])).then((_) {});
        } catch (e) {
          Expect.isTrue(e is StateError);
        }
      });
    });

  }
}

