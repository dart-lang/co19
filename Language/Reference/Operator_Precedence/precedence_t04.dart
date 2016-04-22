/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Operator precedence is given implicitly by the grammar.
 * @description Checks that operator precedence given implicitly by the grammar
 * holds true (equality higher than conditional, relational higher than equality).
 * @author vasya
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals((true ? 1 : ( false ? 1 : 0 )), true ? 1 : false ? 0 : 1);
  Expect.equals((true == (1 <= 2)) ? (false != (2 > 3)) : ((0 >= 1) != false),
      true == 1 <= 2 ? false != 2 > 3 : 0 >= 1 != false);
  Expect.equals(((1 == 0) ? -1 : 100), 1 == 0 ? -1 : 100);
  Expect.equals(((5 - (4 * 2)) > 0) ? 4 : (2 * 4), 5 - 4 * 2 > 0 ? 4 : 2 * 4);
  Expect.equals(12 > (22 > 11 ? 22 : 11) ? 12 : (22 > 11 ? 22 : 11),
      ((12 > (22 > 11 ? 22 : 11) ) ? 12 : (22 > 11 ? 22 : 11)));
}
