/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E removeLast()
 * Throws RangeError if the list is empty.
 * @description Checks that exception is thrown.
 * @author kaigorodov
 */
library removeLast_A03_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {
  List a = create();
  Expect.throws(() {a.removeLast();}, (e) => e is RangeError);
}
