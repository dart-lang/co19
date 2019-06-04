/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int checkValidRange(int start, int end, int length,
 * [String startName, String endName, String message])
 * Check that a range represents a slice of an indexable object.
 *
 * Throws if the range is not valid for an indexable object with the given
 * length. A range is valid for an indexable object with a given length
 *
 * if 0 <= [start] <= [end] <= [length]
 * @description Checks that a RangeError is thrown if condition
 * 0 <= [start] <= [end] <= [length] is not true
 * @issue 28116
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

check(int start, int end, int length) {
  try {
    RangeError.checkValidRange(start, end, length);
    Expect.fail("RangeError expected");
  } on RangeError catch (e) {
    if (start < 0 || start > length) {
      Expect.equals(0, e.start);
      Expect.equals(length, e.end);
      Expect.equals(start, e.invalidValue);
    } else {
      Expect.equals(start, e.start);
      Expect.equals(length, e.end);
      Expect.equals(end, e.invalidValue);
    }
  } catch (e) {
    Expect.fail("Wrong exception type $e");
  }
}

main() {
  // start value breaks the range
  check(-1, 2, 5);
  check(6, 2, 5);
  check(-1, null, 5);

  // end value breaks the range
  check(0, 20, 5);
  check(3, 20, 5);
}
