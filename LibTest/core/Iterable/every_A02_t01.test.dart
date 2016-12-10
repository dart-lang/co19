/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool every(bool f(E element))
 * Checks whether every element of this iterable satisfies test.
 * Checks every element in iteration order, and returns false if any of them
 * make test return false, otherwise returns true.
 * @description Checks that method always returns true on an empty list.
 * @author iefremov
 */
library every_A02_t01;

import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {
  Expect.isTrue(create().every((var v) {return false;}));
}
