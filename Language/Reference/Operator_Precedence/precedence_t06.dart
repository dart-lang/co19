/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Operator precedence is given implicitly by the grammar.
 * @description Checks that operator precedence given implicitly by the grammar 
 * holds true. 
 * @author vasya
 * @reviewer rodionov
 * @needsreview add more cases?
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals( (1 == 1) && (2 == 2), 1 == 1 && 2 == 2);
  Expect.equals( (1 != 1) || (2 == 2), 1 != 1 || 2 == 2);
  Expect.equals( (1 <= 1) && (2 >= 2), 1 <= 1 && 2 >= 2);
  var arr = [true, false];
  Expect.isTrue(!arr[0] == arr[1]);
}
