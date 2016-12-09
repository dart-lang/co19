/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void add(E value)
 * Throws UnsupportedError if the list is not extendable.
 * @description Checks that UnsupportedError exception is thrown
 * if the list is not extendable.
 * @author kaigorodov
 */
library add_A02_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {
  Expect.throws(() {create(1).add(null);}, (e) => e is UnsupportedError);
  Expect.throws(() {create(100).add(null);}, (e) => e is UnsupportedError);
}
