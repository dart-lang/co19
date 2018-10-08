/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion RangeError.index(int index, indexable,
 *    [String name, String message, int length])
 * ...
 * An optional name can specify the argument name that has the invalid value,
 * and the message can override the default error description.
 * ...
 * @description Checks that if name and message are specified they rewrite
 * default ones
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

check(int index, indexable, String name, String message) {
  RangeError re = new RangeError.index(index, indexable, name, message);
  Expect.equals(message, re.message);
  Expect.equals(name, re.name);
  Expect.equals(index, re.invalidValue);
}

main() {
  check(-1, [1, 2, 3], "name1", "message1");
  check(5, [1, 2, 3], "name2", "message2");
  check(1, [1, 2, 3], "name3", "message3");
  check(1, "indexable", "name3", "message3");
}
