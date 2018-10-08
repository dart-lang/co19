/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<bool> isEmpty
 * This operation listens to the stream, and a non-broadcast stream cannot
 * be reused after checking whether it is empty.
 * @description Checks that stream subscription is canceled after result
 * is known.
 * @author a.semenov@unipro.ru
 */
library isEmpty_A04_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check(Stream s, bool expected) {
  asyncStart();
  s.isEmpty.then(
    (bool actual) {
      Expect.equals(expected, actual);
      if (!s.isBroadcast) {
        Expect.throws(() => s.listen((_) {}));
      }
      asyncEnd();
    }
  );
}

void test(CreateStreamFunction create) {
  check(create([]), true);
  check(create([1, 2, 3, null]), false);
  check(create(new Iterable.generate(0, (int index) => 1)), true);
  check(create(new Iterable.generate(10, (int index) => 1)), false);
}
