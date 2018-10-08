/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future forEach(void action(T element))
 * Executes action on each data event of the stream.
 * Completes the returned Future when all events of the stream have been
 * processed.
 * @description Checks that all actions on each data event of the stream are
 * executed.
 * @author kaigorodov
 */
library forEach_A01_t01;
import "dart:async";
import "../../../Utils/expect.dart";

void check<T>(Stream<T> s, List<T> data) {
  List<T> sink = [];
  asyncStart();
  s.forEach((T element) => sink.add(element)).then(
    (_) {
      Expect.listEquals(data, sink);
      asyncEnd();
    }
  );
}

void test(CreateStreamFunction create) {
  check(create([]), []);
  check(create([1, 2, 3, 4]), [1, 2, 3, 4]);
  check(create([null, "2", -3, 4.0, []]), [null, "2", -3, 4.0, []]);
}
