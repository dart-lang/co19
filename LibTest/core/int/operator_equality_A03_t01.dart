/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool operator ==(Object other)
 * ...
 * Returns false if other is not a num.
 * ...
 * @description Check that false is returned if others is not a num
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isFalse(0 == null);
  Expect.isFalse(2 == "");
  Expect.isFalse(2147483648 == true);
  Expect.isFalse(-2147483647 == false);
  Expect.isFalse(-4294967295 == "");
  Expect.isFalse(1844674407370955161 == new Object());
}
