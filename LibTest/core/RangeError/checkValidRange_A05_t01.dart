/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int checkValidRange(int start, int end, int length,
 * [String startName, String endName, String message])
 * ...
 *  Returns the actual end value, which is length if end is null, and end
 *  otherwise.
 *  ...
 * @description Checks that this method returns the actual end value, which is
 * length if end is null, and end otherwise
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

check(int start, int length) {
  try {
    RangeError.checkValidRange(start, null, length);
    Expect.fail("RangeError expected");
  } on RangeError catch (e) {
    Expect.equals(0, e.start);
    Expect.equals(length, e.end);
    Expect.equals(start, e.invalidValue);
  } catch (e) {
    Expect.fail("Wrong exception type $e");
  }
}

main() {
  Expect.equals(3, RangeError.checkValidRange(0, 3, 5));
  Expect.equals(0, RangeError.checkValidRange(0, 0, 1));
  Expect.equals(0, RangeError.checkValidRange(0, 0, 0));

  Expect.equals(5, RangeError.checkValidRange(0, null, 5));
  Expect.equals(5, RangeError.checkValidRange(3, null, 5));
  Expect.equals(5, RangeError.checkValidRange(5, null, 5));
}
