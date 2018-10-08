/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void close()
 * Close the sink. No further events can be added after closing.
 *
 * @description Checks that if sink was closed, no events can be added after
 * closing.
 * @author ngl@unipro.ru
 */
library close_A01_t01;
import "dart:async";
import "../../../Utils/expect.dart";

test(EventSink create()) {
  EventSink es1 = create();
  if (es1 is StreamController) {
    StreamController sc = es1;
    List values = [1, 2, 3];
    int i = 0;

    sc.stream.listen((value) {
      Expect.equals(values[i++], value);
    },
    onError: (error, StackTrace st) {
      Expect.equals(values[i++], error);
      Expect.equals(null, st);
    },
    onDone: () {
      asyncEnd();
    });

    asyncStart();
    es1.add(values[0]);
    es1.addError(values[1]);

    sc.close();
    try {
      es1.add(3);
    } catch (e) {
      Expect.isTrue(e is StateError);
    }
    try {
      es1.addError(4);
    } catch (e) {
      Expect.isTrue(e is StateError);
    }
  }
}

