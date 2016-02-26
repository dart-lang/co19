/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a case clause case ek: sk of a switch statement
 * switch (e) {
 *   label11 … label1j1 case e1: s1
 * …
 *   labeln1 ..labelnjn case en: sn
 * }
 * proceeds as follows:
 * The expression ek == id is evaluated to an object o which is then subjected
 * to boolean conversion yielding a value v. If v is not true, the following
 * case, case ek+1: sk+1 is executed if it exists. If v is true, let h be the
 * smallest integer such that h >= k and sh is non-empty. The sequence of
 * statements sh is executed if it exists. If execution reaches the point after
 * sh then a runtime error occurs, unless h = n.
 * @description Checks that the cases are tested in the specified order, top to
 * bottom and if there're no statements in the matching case, then Dart
 * continues looking for statements to execute down from there. Some case
 * expressions are equal to each other.
 * @author rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

test(value) {
  var result;

  switch (value) {
    case 3:
      return 1;
    case 1:
      return 2;
    case 2:
      return 3;
    case 1:
      return 4;
    case 1:
      return 5;
    case 2:
      return 6;
    case 4:
    case 5:
    case 6:
      return 7;
  }
  return result;
}

main() {
  Expect.equals(2, test(1));
  Expect.equals(3, test(2));
  Expect.equals(1, test(3));
  Expect.equals(7, test(4));
  Expect.equals(7, test(5));
  Expect.equals(7, test(6));
  Expect.equals(null, test(7));
}
