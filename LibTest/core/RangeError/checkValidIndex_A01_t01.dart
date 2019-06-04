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
 * into an indexable object.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

check(int index, indexable) {
  try {
    RangeError.checkValidIndex(index, indexable);
    Expect.fail("RangeError expected");
  } on RangeError catch (e) {
    Expect.equals(index, e.invalidValue);
    Expect.equals("index", e.name);
    Expect.equals("Index out of range", e.message);
    Expect.equals(0, e.start);
    Expect.equals(indexable.length - 1, e.end);
  } catch (e) {
    Expect.fail("Wrong exception type $e");
  }
}

main() {
  RangeError.checkValidIndex(0, [1, 2, 3]);
  RangeError.checkValidIndex(1, [1, 2, 3]);
  RangeError.checkValidIndex(2, [1, 2, 3]);

  check(-1, [1, 2, 3]);
  check(4, [1, 2, 3]);
}
