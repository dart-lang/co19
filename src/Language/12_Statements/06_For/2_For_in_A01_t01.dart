/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A for statement of the form for (varOrType? id in e) s
 *  is equivalent to the following code:
 *    var n0 = e.iterator();
 *    while (n0.hasNext) {
 *      varOrType? id = n0.next();
 *      s
 *    }
 *  where n0 is an identiﬁer that does not occur anywhere in the program.
 * @description Checks that a for statement of the form for (varOrType? id in e) s
 * is equivalent to the the following code:
 * var n0 = e.iterator(); while (n0.hasNext) { varOrType? id = n0.next(); s }
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

main() {
  List<int> e = [1, 3, 64, -4, 0, 1241, -124124, 457];
  int sum1 = 0;
  for (int id in e) {
    sum1 = sum1 * 31 + id;
  }

  var n = e.iterator();
  int sum2 = 0;
  while (n.hasNext) {
    var id = n.next();
    sum2 = sum2 * 31 + id;
  }
  
  int id;
  int sum3 = 0;
  for(id in e) {
    sum3 = sum3 * 31 + id;
  }
  
  Expect.equals(sum1, sum2);
  Expect.equals(sum3, sum2);
}
