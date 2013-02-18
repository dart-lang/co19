/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double ceil()
 * @description Checks that [:ceil():] called on a positive or negative
 * infinity returns the same value.
 * @author pagolubev
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";


main() {
  double inf = 1.0 / .0;
  Expect.equals(inf, inf.ceil());
  Expect.equals(-inf, (-inf).ceil());
}
