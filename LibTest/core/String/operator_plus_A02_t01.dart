/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String operator +(String other)
 * ...
 * @description Checks that if other string is null then exception is thrown
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {
    "" + null;
  });
  Expect.throws(() {
    r" " + null;
  });
  Expect.throws(() {
    "\n" + null;
  });
}
