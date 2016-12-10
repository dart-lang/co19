/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void set length(int newLength)
 * Throws an [UnsupportedError] if the list is not extendable.
 * @description Checks that the exception is thrown.
 * @author kaigorodov
 */
library length_A04_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {
  List a = create(0);
  Expect.throws(() {a.length = 1;}, (e) => e is UnsupportedError);
  a = create(100);
  Expect.throws(() {a.length = 1;}, (e) => e is UnsupportedError);
}
