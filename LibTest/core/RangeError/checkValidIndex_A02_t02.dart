/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void checkValidIndex(int index, indexable, [String name,
 * int length, String message])
 * ...
 * If length is provided, it is used as the length of the indexable object,
 * otherwise the length is found as indexable.length.
 * @description Checks that if length is not provided, then  the length is found
 * as indexable.length
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

check(int index, indexable, String name) {
  try {
    RangeError.checkValidIndex(index, indexable, name);
    Expect.fail("RangeError expected");
  } on RangeError catch (e) {
    Expect.equals(index, e.invalidValue);
    if (name == null) {
      Expect.equals("index", e.name);
    } else {
      Expect.equals(name, e.name);
    }
    Expect.equals("Index out of range", e.message);
    Expect.equals(0, e.start);
    Expect.equals(indexable.length - 1, e.end);
  } catch (e) {
    Expect.fail("Wrong exception type $e");
  }
}

main() {
  RangeError.checkValidIndex(0, [1, 2, 3], "name1");
  RangeError.checkValidIndex(1, [1, 2, 3], "name2");
  RangeError.checkValidIndex(2, [1, 2, 3], "name3");
  RangeError.checkValidIndex(2, [1, 2, 3], null);

  check(-1, [1, 2, 3], "name4");
  check(3, [1, 2, 3], "name5");
  check(11, [1, 2, 3], null);
}
