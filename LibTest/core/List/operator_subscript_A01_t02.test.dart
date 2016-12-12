/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E operator [](int index)
 * @description Checks extendable arrays.
 * @author varlax
 */
library operator_subscript_A01_t02;

import "../../../Utils/expect.dart";

test(List create([int length])) {
  List from(Iterable content) {
    List res = create(content.length);
    res.setRange(0, content.length, content);
    return res;
  }
  Expect.isTrue(from([1, 0])[0] == 1);
  var a = [];
  Expect.identical(from([a, 0])[0], a);
  Expect.isTrue(from([1, 2, 3])[0] == 1);
  Expect.isTrue(from([null, null, null])[0] == null);

  Expect.identical(from([1, 2, 3])[2], 3);
  Expect.identical(from([1, null, 3])[1], null);
  Expect.identical(from([1, 2, null])[2], null);
 
  var b = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
  a = from(b.getRange(1, 10));
  for(int i = 1; i <= a.length; ++i) {
    Expect.identical(a[i - 1], i);
    Expect.identical(a[a.length - i], a.length + 1 - i);
  }
}
