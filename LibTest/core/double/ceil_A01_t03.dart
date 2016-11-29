/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract int ceil()
 * Returns the least integer no smaller than this.
 * @description Checks that [:ceil():] called on a positive or negative zero
 * returns zero.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(0, (.0).ceil());
  Expect.equals(0, (-.0).ceil());
}
