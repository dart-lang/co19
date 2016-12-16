/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void checkNotNegative(int value, [String name, String message])
 * Check that an integer value isn't negative.
 * Throws if the value is negative.
 * @description Checks that this method doesn't throw an exception if value
 * isn't negative
 * @author sgrekhov@unipro.ru
 */

main() {
  RangeError.checkNotNegative(0);
  RangeError.checkNotNegative(1);
  RangeError.checkNotNegative(0, "name1");
  RangeError.checkNotNegative(1, "name2", "message2");
}
