/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<String> join([String separator = ""])
 * Collects string of data events' string representations.
 * If separator is provided, it is inserted between any two elements.
 * @description Checks that it joins string representations correctly.
 * @author ilya
 */
library join_A01_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void test(CreateStreamFunction create) {
  List iterable = [1, null, false, true, 'string', #symbol, (x) => x++];
  iterable.add(iterable); // add self reference
  Stream s = create(iterable);

  asyncStart();
  s.join().then((x) {
    Expect.equals(iterable.join(), x);
    asyncEnd();
  });
}
