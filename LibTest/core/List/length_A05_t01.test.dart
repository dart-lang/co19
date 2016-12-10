/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void set length(int newLength)
 * Throws [RangeError] if the [length] is negative.
 * @description Checks that the exception is thrown as expected.
 * @author kaigorodov
 */
library length_A05_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {
  Expect.throws(() {create().length = -1;}, (e) => e is RangeError);
}
