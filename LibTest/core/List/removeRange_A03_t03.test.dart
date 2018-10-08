/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void removeRange(int start, int end)
 * An error occurs if start.. end is not a valid range for this.
 * @description Checks that exception is thrown if start or end is not of type
 * int.
 * @author vasya
 */
library removeRange_A03_t03;

import "../../../Utils/expect.dart";

test(List create([int length])) {

  void check(dynamic start, dynamic end) {
    var l = create();
    Expect.throws(() {l.removeRange(start, end);});
 }
  check(null, 1);
  check(0, null);
  check(0, "1");
  check(0.0, 1);
}
