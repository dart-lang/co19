/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String operator *(int times)
 * ...
 * Returns an empty string if times is zero or negative.
 * @description Checks that this operator returns an empty string if times is
 * zero or negative.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("", "s" * 0);
  Expect.equals("", "\\s" * -1);
  Expect.equals("", r"\s" * -100);
}
