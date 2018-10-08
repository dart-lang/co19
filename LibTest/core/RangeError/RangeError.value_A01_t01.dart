/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion RangeError.value(num value, [String name, String message])
 * Create a new RangeError with a message for the given value.
 * @description Checks that this constructor creates RangeError a message for
 * the given value
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

check(num value) {
  RangeError re = new RangeError.value(value);
  Expect.equals(null, re.name);
  Expect.equals("Value not in range", re.message);
  Expect.equals(value, re.invalidValue);
}

main() {
  check(-1);
  check(3.14);
  check(null);
}
