// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion A for statement of the form for (finalConstVarOrType? id in e) s
/// is equivalent to the following code:
///   var n0 = e.iterator;
///   while (n0.moveNext()) {
///     finalConstVarOrType? id = n0.current;
///     s
///   }
/// where n0 is an identifier that does not occur anywhere in the program, except
/// that for purposes of static typechecking, it is checked under the assumption
/// that n0 is declared to be of type T, where T is the static type of e.iterator.
/// @description Checks that a for statement of the form
/// for (finalConstVarOrType? id in e) s is equivalent to the following code:
/// var n0 = e.iterator; while (n0.moveNext()) { varOrType? id = n0.current; s }
/// @author vasya
/// @reviewer rodionov
/// @reviewer iefremov

import '../../../../Utils/expect.dart';

main() {
  List<int> e = [1, 3, 64, -4, 0, 1241, -124124, 457];
  int sum1 = 0;
  for (int id in e) {
    sum1 = sum1 * 31 + id;
  }

  var n = e.iterator;
  int sum2 = 0;
  while (n.moveNext()) {
    var id = n.current;
    sum2 = sum2 * 31 + id;
  }

  int id;
  int sum3 = 0;
  for (id in e) {
    sum3 = sum3 * 31 + id;
  }

  Expect.equals(sum1, sum2);
  Expect.equals(sum3, sum2);
}
