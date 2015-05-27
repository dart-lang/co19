/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * abstract abstract double floorToDouble()
 * Returns the greatest integer value no greater than this.
 * The result is a double.
 * @description Checks that [:floorToDouble():] called on a positive or negative
 * zero returns the same value.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";


main() {
  Expect.equals(.0, (.0).floor());
  Expect.equals(-.0, (-.0).floor());
}
