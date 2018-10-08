/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isNegative
 * Returns whether this Duration is negative.
 * @description Checks that this property returns correct value
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(new Duration(days: -1).isNegative);
  Expect.isTrue(new Duration(microseconds: -1).isNegative);
  Expect.isFalse(Duration.zero.isNegative);
  Expect.isFalse(new Duration(days: 1).isNegative);
  Expect.isFalse(new Duration(microseconds: 1).isNegative);
}
