/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int checkValidRange(int start, int end, int length,
 * [String startName, String endName, String message])
 * ...
 * The startName and endName defaults to "start" and "end", respectively.
 * @description Checks that startName and endName defaults to "start" and "end",
 * respectively.
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
      Expect.equals("start", e.name);
    } else {
      Expect.equals("end", e.name);
    }
  } catch (e) {
    Expect.fail("Wrong exception type $e");
  }
}

main() {
  // start value breaks the range
  check(-1, 2, 5);

  // end value breaks the range
  check(0, 20, 5);
}
