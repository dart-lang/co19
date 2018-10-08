/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void removeRange(int start, int end)
 * An error occurs if start.. end is not a valid range for this.
 * @description Checks that an [RangeError] is thrown if [length] is negative.
 * @author vasya
 */
library removeRange_A03_t01;

import "../../../Utils/expect.dart";

check(list) {
  Expect.throws(() {list.removeRange(0, -1);}, (e) => e is RangeError);
}

test(List create([int length])) {
  var a = create();
  a.length = 1;
  check(a);
}
