/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A for statement of the form for (finalConstVarOrType? id in e) s
 * is equivalent to the following code:
 *   var n0 = e.iterator;
 *   while (n0.moveNext()) {
 *     finalConstVarOrType? id = n0.current;
 *     s
 *   }
 * where n0 is an identifier that does not occur anywhere in the program, except
 * that for purposes of static typechecking, it is checked under the assumption
 * that n0 is declared to be of type T, where T is the static type of e.iterator.
 * @description Checks that s is not evaluated if e is empty.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */
import '../../../../Utils/expect.dart';

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
