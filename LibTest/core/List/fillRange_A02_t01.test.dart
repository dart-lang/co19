/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void fillRange(int start, int end, [E fillValue])
 * It is an error if start..end is not a valid range pointing into the this.
 * @description Checks that it is an error if start..end is not a valid range
 * pointing into the this.
 * @author kaigorodov
 */
library fillRange_A02_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {
  List a = create();
  a.fillRange(0, 0);
  Expect.throws(() {a.fillRange(0, 1);}, (e) => e is RangeError);
  
  a.add(1);
  a.fillRange(0, 1, 2);
  Expect.throws(() {a.fillRange(1, 2);}, (e) => e is RangeError);
}
