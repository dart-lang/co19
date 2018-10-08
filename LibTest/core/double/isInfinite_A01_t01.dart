/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isInfinite
 * @description Checks that 1/0 and -1/0 are infinite.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

main() {
  double inf = 1 / 0;
  Expect.isTrue(inf.isInfinite);
  Expect.isTrue((-inf).isInfinite);

  Expect.isTrue((double.infinity).isInfinite);
  Expect.isTrue((double.negativeInfinity).isInfinite);
}
