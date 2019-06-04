/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void checkNotNegative(int value, [String name, String message])
 * Check that an integer value isn't negative.
 * Throws if the value is negative.
 * @description Checks that this method throws a RangeError if value
 * is negative
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
 
main() {
  try {
    RangeError.checkNotNegative(-1);
    Expect.fail("RangeError expected");
  } on RangeError catch (e) {
    Expect.equals(-1, e.invalidValue);
    Expect.equals(null, e.name);
    Expect.equals("Invalid value", e.message);
    Expect.equals(0, e.start);
    Expect.equals(null, e.end);
  } catch (e) {
    Expect.fail("Wrong exception type: $e");
  }



  try {
    RangeError.checkNotNegative(-2, "name1");
  } on RangeError catch (e) {
    Expect.equals(-2, e.invalidValue);
    Expect.equals("name1", e.name);
    Expect.equals("Invalid value", e.message);
    Expect.equals(0, e.start);
    Expect.equals(null, e.end);
  } catch (e) {
    Expect.fail("Wrong exception type $e");
  }


  try {
    RangeError.checkNotNegative(-3, "name2", "message2");
  } on RangeError catch (e) {
    Expect.equals(-3, e.invalidValue);
    Expect.equals("name2", e.name);
    Expect.equals("message2", e.message);
    Expect.equals(0, e.start);
    Expect.equals(null, e.end);
  } catch (e) {
    Expect.fail("Wrong exception type $e");
  }

}
