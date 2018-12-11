/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Iterable<E> getRange(int start, int end)
 * An error occurs if end is before start.
 * @description Checks that an error is thrown if end is before start.
 * @author vasya
 * @reviewer varlax
 */
library getRange_A02_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {

  check(content, arg) {
    List list = create();
    list.addAll(content);
    Expect.throws(() {list.getRange(0, arg);}, (e) => e is ArgumentError);
  }

  check(new List(1), -1);
  check(new List(1), -(1 << 63));
  check([1], -1);
  check([1], -(1 << 63));
  check(const [1], -1);
  check(const [1], -(1 << 63));
  check(new List(), -1);
  check(new List(), -(1 << 63));
}
