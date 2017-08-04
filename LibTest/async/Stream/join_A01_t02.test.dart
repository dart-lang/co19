/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<String> join([String separator = ""])
 * Collects string of data events' string representations.
 * If separator is provided, it is inserted between any two elements.
 * @description Checks that it joins string representations correctly if
 * separator is provided.
 * @author ilya
 */
library join_A01_t02;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

void test(Stream<T> create(Iterable<T> data)) {
  Iterable iterable = [1, null, false, true, 'string', #symbol, (x) => x++];
  iterable.add(iterable); // add self reference
  Stream s = create(iterable);

  asyncStart();
  s.join('---qwe---').then((x) {
    Expect.equals(iterable.join('---qwe---'), x);
    asyncEnd();
  });
}
