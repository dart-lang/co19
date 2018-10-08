/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion RangeError.index(int index, indexable,
 *    [String name, String message, int length])
 * Creates a new RangeError stating that index is not a valid index into
 * indexable.
 * @description Checks that this constructor creates RangeError stating that
 * index is not a valid index into indexable. Test empty and null indexable
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  RangeError re1 = new RangeError.index(-1, []);
  Expect.equals("Index out of range", re1.message);
  Expect.isNull(re1.name);
  Expect.equals(-1, re1.invalidValue);

  RangeError re2 = new RangeError.index(5, []);
  Expect.equals("Index out of range", re2.message);
  Expect.isNull(re2.name);
  Expect.equals(5, re2.invalidValue);

  Expect.throws(() {new RangeError.index(1, null);});

  RangeError re3 = new RangeError.index(1, null, "name", "message", 3);
  Expect.equals("message", re3.message);
  Expect.equals("name", re3.name);
  Expect.equals(1, re3.invalidValue);

  RangeError re4 = new RangeError.index(null, null, "name", "message", 3);
  Expect.equals("message", re4.message);
  Expect.equals("name", re4.name);
  Expect.isNull(re4.invalidValue);
}
