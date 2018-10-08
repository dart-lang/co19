/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion RangeError(message)
 * Create a new RangeError with the given message.
 * @description Checks that this constructor creates RangeError with the given
 * message and null name and value
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  RangeError re1 = new RangeError(0);
  Expect.equals(0, re1.message);
  Expect.isNull(re1.name);
  Expect.isNull(re1.invalidValue);

  RangeError re2 = new RangeError("Some message");
  Expect.equals("Some message", re2.message);
  Expect.isNull(re2.name);
  Expect.isNull(re2.invalidValue);

  RangeError re3 = new RangeError(null);
  Expect.isNull(re3.message);
  Expect.isNull(re3.name);
  Expect.isNull(re3.invalidValue);
}
