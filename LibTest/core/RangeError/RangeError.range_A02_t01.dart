/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion RangeError.range(num invalidValue, int minValue, int maxValue,
 *    [String name, String message])
 * ...
 * An optional name can specify the argument name that has the invalid value,
 * and the message can override the default error description.
 * @description Checks that if name or message is specified then it overrides
 * the default value.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  RangeError re = new RangeError.range(1, 1, 1);

  RangeError re1 = new RangeError.range(-1, 1, 3, "name1");
  Expect.equals(1, re1.start);
  Expect.equals(3, re1.end);
  Expect.equals(-1, re1.invalidValue);
  Expect.equals("name1", re1.name);
  Expect.equals(re.message, re1.message);

  RangeError re2 = new RangeError.range(-1, 11, 13, "name2", "message2");
  Expect.equals(11, re2.start);
  Expect.equals(13, re2.end);
  Expect.equals(-1, re2.invalidValue);
  Expect.equals("name2", re2.name);
  Expect.equals("message2", re2.message);
}
