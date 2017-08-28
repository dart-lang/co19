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
 * @author ilya
 */
library elementAt_A01_t03;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

const int INDEX = 10;

void test(CreateStreamFunction create) {
  int i = -1;
  Stream s = create(new Iterable.generate(100, (i) => i));
  s = s.map(
    (e) {
      i++;
      return e;
    }
  );
  asyncStart();
  s.elementAt(INDEX).then(
    (t) {
      Expect.equals(INDEX, i);
      asyncEnd();
    }
  );
}
