/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int checkValidRange(int start, int end, int length,
 * [String startName, String endName, String message])
 * Check that a range represents a slice of an indexable object.
 * @description Checks that if startName, endName and message are set then name
 * and message have appropriate values
 * @issue 28116
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

check(int start, int end, int length, String startName, String endName,
    String message) {
  try {
    RangeError.checkValidRange(start, end, length, startName, endName, message);
    Expect.fail("RangeError expected");
  } on RangeError catch (e) {
    if (start < 0 || start > length) {
      if (startName != null) {
        Expect.equals(startName, e.name);
      } else {
        Expect.equals("start", e.name);
      }
    } else {
      if (endName != null) {
        Expect.equals(endName, e.name);
      } else {
        Expect.equals("end", e.name);
      }
    }
    if (message != null) {
      Expect.equals(message, e.message);
    } else {
      Expect.equals("Invalid value", e.message);
    }
  } catch (e) {
    Expect.fail("Wrong exception type $e");
  }
}

main() {
  // start value breaks the range
  check(-1, 2, 5, "Start name", "End name", "Just message");
  check(6, 2, 5, "Start name", "End name", null);
  check(6, 2, 5, null, "End name", null);
  check(6, 2, 5, null, null, null);
  check(-1, 2, 5, "Start name", null, "Just message");

  // end value breaks the range
  check(0, 20, 5, "Start name", "End name", "Just message");
  check(3, 20, 5, "Start name", "End name", null);
  check(3, 20, 5, null, "End name", null);
  check(3, 20, 5, null, null, null);
  check(3, 20, 5, "Start name", null, "Just message");
}
