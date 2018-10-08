/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> reduce(T combine(T previous, T element))
 * Reduces a sequence of values by repeatedly applying combine.
 * @description Checks that the combine method is not called for the first
 * element in stream.
 * @author a.semenov@unipro.ru
 */
library reduce_A01_t04;
import "dart:async";
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  List<int> log = [];

  int combine(int p, int e) {
    log.add(p);
    log.add(e);
    return p + e;
  }

  Stream<int> s = create([1, 2, 3, 4]);
  asyncStart();
  s.reduce(combine).then(
      (value) {
        Expect.equals(10, value);
        Expect.listEquals([1, 2, 3, 3, 6, 4], log);
        asyncEnd();
      }
  );
}
