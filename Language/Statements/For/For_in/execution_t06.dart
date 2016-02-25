/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
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
 * @description Checks that a loop variable in for-in statement may be declared
 * final.
 * @author ngl@unipro.ru
 */
import '../../../../Utils/expect.dart';

main() {
  List<int> e = [1, 2, 3, 4, 5, 6, 7, 8];
  int sum1 = 0;
  for (final int id in e) {
    sum1 = sum1 * 2 + id;
  }

  var n = e.iterator;
  int sum2 = 0;
  while (n.moveNext()) {
    final int id = n.current;
    sum2 = sum2 * 2 + id;
  }

  int sum3 = 0;
  for (final id in e) {
    sum3 = sum3 * 2 + id;
  }

  Expect.equals(sum1, sum2);
  Expect.equals(sum3, sum2);
}
