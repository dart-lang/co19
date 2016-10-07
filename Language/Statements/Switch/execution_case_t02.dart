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
 *   label(n+1)1 ..label(n+1)jn default: sn+1
 * }
 * proceeds as follows:
 * The expression ek == id  is evaluated to an object o which is then subjected
 * to boolean conversion yielding a value v. If v is not true, the following
 * case, case ek+1: sk+1 is executed if it exists. If case ek+1: sk+1 does not
 * exist, then the default clause is executed by executing sn+1. If v is true,
 * let h be the smallest integer such that h >= k and sh is non-empty. If no
 * such h exists, let h = n + 1. The sequence of statements sh is then executed.
 * If execution reaches the point after sh then a runtime error occurs, unless
 * h = n + 1.
 * @description Checks that falling through produces no errors, if  the current
 * clause is an empty case clause or the default clause.
 * @author msyabro
 * @reviewer rodionov
 * @issue 7537
 */
import '../../../Utils/expect.dart';

testEmptyCases(value) {
  var result;

  switch (value) {
    case 1:
    case 2: result = 1;
      break;
    case 3:
    case 4: result = 2;
      break;
    case 5:
    case 6:
    default:
  }

  return result;
}

main() {
  Expect.equals(null, testEmptyCases(5));
  Expect.equals(null, testEmptyCases(6));
  Expect.equals(2, testEmptyCases(3));
  Expect.equals(1, testEmptyCases(1));
  Expect.equals(1, testEmptyCases(2));
}
