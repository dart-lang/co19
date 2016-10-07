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
 * @description Checks that falling through produces a runtime error, unless
 * the current case clause is empty or the last case clause.
 * @compile-error
 * @author sgrekhov@unipro.ru
 * @issue 7537
 */


test(value) {
  var result;

  switch (value) {
    case 1:  result = 1;
             break;
    case 2:  result = 2;
    case 3:  result = 3;
  }
  return result;
}
main() {
  test(0);
}
