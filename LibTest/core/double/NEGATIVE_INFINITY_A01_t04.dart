/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double NEGATIVE_INFINITY
 * @description Checks that type of NEGATIVE_INFINITY is double
 * @author hlodvig
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isFalse(double.negativeInfinity is int);
  Expect.isTrue(double.negativeInfinity is double);
  Expect.isTrue(double.negativeInfinity is num);
}
