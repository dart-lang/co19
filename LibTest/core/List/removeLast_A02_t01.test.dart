/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E removeLast()
 * Throws a UnsupportedError if the length of the list cannot be changed.
 * @description Checks that [UnsupportedError] exception is thrown
 * if the length of the list cannot be changed.
 * @author vasya
 */
library removeLast_A02_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {
  List a = create(1);
  a[0] = 0;
  Expect.throws(() {a.removeLast();}, (e) => e is UnsupportedError);
}
