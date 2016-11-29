/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract double ceilToDouble()
 * Returns the least integer value no smaller than this.
 * The result is a double.
 * @description Checks that [:ceilToDouble():] called on a positive or negative
 * zero returns the same value.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(0.0, (.0).ceil());
  Expect.equals(-0.0, (-.0).ceil());
}
