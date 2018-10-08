/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> elementAt(int index)
 * Returns the value of the indexth data event of this stream.
 * Stops listening to the stream after the indexth data event has been received.
 * @description Checks that it stops listening to the stream after a value has
 * been found.
 * @author a.semenov@unipro.ru
 */
library elementAt_A01_t02;
import "dart:async";
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  Stream<int> s = create(new Iterable<int>.generate(100, (int i) => i));
  asyncStart();
  s.elementAt(5).then(
    (int t) {
      if (!s.isBroadcast) {
        Expect.throws(() => s.listen((_) {}));
      }
      asyncEnd();
    }
  );
}
