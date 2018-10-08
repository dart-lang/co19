/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract int round()
 * Returns the integer closest to this.
 * Rounds away from zero when there is no closest integer:
 * (3.5).round() == 4 and (-3.5).round() == -4.
 * @description Checks that [:round():] on a positive or negative zeros
 * returns zero.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(0, 0.round());
  Expect.equals(0, (-.0).round());
}
