/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> single
 * Returns the single element.
 * @description Checks that the single element is returned.
 * @author kaigorodov
 */
library single_A01_t01;
import "dart:async";
import "../../../Utils/async_utils.dart";
import "../../../Utils/expect.dart";

const int VALUE = 123;

void test(Stream<T> create(Iterable<T> data)) {
  Stream s = create([VALUE]);
  asyncStart();
  s.single.then(
      (value) {
        Expect.equals(VALUE, value);
        asyncEnd();
      }
  );
}
