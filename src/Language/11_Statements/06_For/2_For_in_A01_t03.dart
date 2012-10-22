/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A for statement of the form for (varOrType? id in e) s
 *  is equivalent to the following code:
 *    var n0 = e.iterator();
 *    while (n0.hasNext()) {
 *      varOrType? id = n0.next();
 *      s
 *    }
 *  where n0 is an identiﬁer that does not occur anywhere in the program.
 * @description Checks that s is not evaluated if e is empty.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

void check(var e) {
  var b = false;
  for (var id in e) {
    b = true;
  }
  Expect.isFalse(b);
}

main() {
  check(new List());
  check([]);
  check(new Set());
}
