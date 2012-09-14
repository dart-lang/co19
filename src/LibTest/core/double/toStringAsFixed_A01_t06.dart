/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toStringAsFixed(int fractionDigits)
 * @description Checks that an exception is thrown when 'fractionDigits' is 100.
 * @author pagolubev
 * @reviewer msyabro
 * @needsreview Exception type? Max acceptable 'fractionDigits' value?
 */


main() {
  bool fail = false;
  try {
    .1.toStringAsFixed(100);
    fail = true;
  } catch (var e) {}
  if(fail) {
    Expect.fail("Expected exception");
  }
}
