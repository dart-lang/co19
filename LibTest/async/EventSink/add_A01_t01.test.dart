/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void add(T event)
 * Send a data event to a stream.
 *
 * @description Checks the add method.
 * @author ngl@unipro.ru
 */
library add_A01_t01;
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
    onError: (error) {
      Expect.fail("Should not be here: $error");
    },
    onDone: () {
      asyncEnd();
    });

    asyncStart();
    for (int k = 0; k < values.length; k++) {
      es1.add(values[k]);
    }
    sc.close();
  }
}

