/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addError(errorEvent, [StackTrace stackTrace])
 * Send an async error to a stream.
 *
 * @description Checks the addError method.
 * @author ngl@unipro.ru
 */
library addError_A01_t01;
import "dart:async";
import "../../../Utils/expect.dart";

test(EventSink create()) {
  EventSink es1 = create();
  if (es1 is StreamController) {
    StreamController sc = es1;
    List values = [1, 2, 3];
    int i = 0;

    sc.stream.listen((value) {
      Expect.fail("Should not be here: $value");
    },
    onError: (error, StackTrace st) {
      Expect.equals(values[i++], error);
      Expect.equals(null, st);
    },
    onDone: () {
      asyncEnd();
    });

    asyncStart();
    for (int k = 0; k < values.length; k++) {
      es1.addError(values[k]);
    }
    sc.close();
  }
}

