/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double INFINITY
 * @description Checks INFINITY is equal to INFINITY using equality operator
 * @author hlodvig
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(double.infinity == double.infinity);
  Expect.isFalse(double.infinity != double.infinity);
}
