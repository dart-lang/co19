/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isFinite
 * True if the number is finite; otherwise, false.
 * The only non-finite numbers are NaN, positive infinity and negative infinity.
 * @description Checks that this method returns true for integers
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(0.isFinite);
  Expect.isTrue(123456.isFinite);
  Expect.isTrue(8000000000000000000.isFinite);
  Expect.isTrue((-8000000000000000000).isFinite);
}
