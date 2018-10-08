/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * Throws an UnsupportedError if this is a fixed-length list.
 * @description Checks that an [UnsupportedError] is thrown as expected.
 * @author vasya
 */
library removeRange_A02_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {
  var a = create(1);
  Expect.throws(() {a.removeRange(0, 1);}, (e) => e is UnsupportedError);
}
