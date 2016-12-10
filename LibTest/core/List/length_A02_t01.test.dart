/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  abstract void set length(int newLength)
 * If [newLength] is greater than the current [length], entries are initialized
 * to [null].
 * @description Checks that entries are initialized to [null] 
 * if [newLength] is greater than the current [length].
 * @author vasya
 */
library length_A02_t01;

import "../../../Utils/expect.dart";

void assertIsNull(List a, int oldLength) {
  for (int i = oldLength; i < a.length; i++) {
    Expect.isTrue(a[i] == null);
  }
}

test(List create([int length])) {
  List a = create();
  a.length = 100;
  assertIsNull(a, 0);
  a[99] = 100;

  a.length = 35674;
  assertIsNull(a, 100);

  a.length = 50000;
  assertIsNull(a, 35674);

  a = create();
  a.addAll([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17]);
  var len = a.length;
  a.length = 1000;
  assertIsNull(a,len);
}
