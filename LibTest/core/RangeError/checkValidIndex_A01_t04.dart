/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void checkValidIndex(int index, indexable, [String name,
 * int length, String message])
 * Check that a value is a valid index into an indexable object.
 * Throws if index is not a valid index into indexable
 * @description Checks that this method checks that a value is a valid index
 * into an indexable object and name, length amd message have correct values set
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

check(int index, indexable, String name, int length, String message) {
  try {
    RangeError.checkValidIndex(index, indexable, name, length, message);
    Expect.fail("RangeError expected");
  } on RangeError catch (e) {
    Expect.equals(index, e.invalidValue);
    if (name == null) {
      Expect.equals("index", e.name);
    } else {
      Expect.equals(name, e.name);
    }
    if (message == null) {
      Expect.equals("Index out of range", e.message);
    } else {
      Expect.equals(message, e.message);
    }
    Expect.equals(0, e.start);
    if (length == null) {
      Expect.equals(indexable.length - 1, e.end);
    } else {
      Expect.equals(length - 1, e.end);
    }
  } catch (e) {
    Expect.fail("Wrong exception type $e");
  }
}

main() {
  RangeError.checkValidIndex(0, [1, 2, 3], "name1", 10, "message1");
  RangeError.checkValidIndex(1, [1, 2, 3], "name2", 10, "message2");
  RangeError.checkValidIndex(2, [1, 2, 3], "name3", 10, "message3");
  RangeError.checkValidIndex(2, [1, 2, 3], null, 10, "message4");
  RangeError.checkValidIndex(2, [1, 2, 3], null, 10, null);

  check(-1, [1, 2, 3], "name4", 10, "message4");
  check(14, [1, 2, 3], "name5", 10, "message5");
  check(14, [1, 2, 3], null, 10, "message6");
  check(-4, [1, 2, 3], null, 10, null);
  check(4, [1, 2, 3], "name6", null, null);
  check(4, [1, 2, 3], "name7", -1, "message7");
  check(2, [1, 2, 3], "name8", 2, null);
  check(2, [1, 2, 3], "name9", 1, "message9");
}
