/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double NEGATIVE_INFINITY
 * @description Checks NEGATIVE_INFINITY is equal to NEGATIVE_INFINITY using
 * equality operator
 * @author hlodvig
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(double.negativeInfinity == double.negativeInfinity);
  Expect.isFalse(double.negativeInfinity != double.negativeInfinity);
}
