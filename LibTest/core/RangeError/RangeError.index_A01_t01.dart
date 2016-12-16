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
 * index is not a valid index into indexable.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  RangeError re1 = new RangeError.index(-1, [1, 2, 3]);
  Expect.equals("Index out of range", re1.message);
  Expect.isNull(re1.name);
  Expect.equals(-1, re1.invalidValue);

  RangeError re2 = new RangeError.index(5, [1, 2, 3]);
  Expect.equals("Index out of range", re2.message);
  Expect.isNull(re2.name);
  Expect.equals(5, re2.invalidValue);

  RangeError re3 = new RangeError.index(1, [1, 2, 3]);
  Expect.equals("Index out of range", re3.message);
  Expect.isNull(re3.name);
  Expect.equals(1, re3.invalidValue);
}
