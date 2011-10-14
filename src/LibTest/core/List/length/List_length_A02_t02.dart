/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Changes the length of the list. If [newLength] is greater than
 * the current [length], entries are initialized to [null].
 * @description Checks that entries are initialized to [null] 
 * if [newLength] is greater than the current [length].
 * @author vasya
 * @needsreview This test rather tests specification tha list class
 * @reviewer msyabro
 */

void assertIsNull(List a, int oldLength) {
  for (int i = oldLength; i < a.length; i++) {
    Expect.isTrue(a[i] == null);
  }
}

main() {
  List a = new List();
  a.length = 100;
  assertIsNull(a, 0);
  a[99] = 100;

  a.length = 35674;
  assertIsNull(a, 100);

  a.length = 50000;
  assertIsNull(a, 35674);
}
