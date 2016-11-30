/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isNaN
 * @description Checks that 0 / 0 is NaN.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue((0/0).isNaN);
  Expect.isFalse(1.0.isNaN);
}
