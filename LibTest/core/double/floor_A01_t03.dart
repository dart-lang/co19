/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * abstract int floor()
 * Returns the greatest integer no greater than this.
 * @description Checks that [:floor():] called on a positive or negative
 * zero returns zero.
 * @author pagolubev
 */
import "../../../Utils/expect.dart";


main() {
  Expect.equals(0, (.0).floor());
  Expect.equals(0, (-.0).floor());
}
