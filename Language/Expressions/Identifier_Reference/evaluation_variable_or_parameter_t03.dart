/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an identifier expression e of the form id proceeds
 * as follows:
 * Let d be the innermost declaration in the enclosing lexical scope whose name
 * is id or id=. If no such declaration exists in the lexical scope, let d be
 * the declaration of the inherited member named id if it exists.
 * ...
 * • If d is a local variable or formal parameter then e evaluates to the
 *   current binding of id.
 * @description Checks that a reference to a variable in a loop is evaluated
 * correctly in closures nested inside that loop.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';


main() {
  var acc = [];
  for (var i = 0; i < 10; ++i, () {acc.add(i);}());
  Expect.listEquals([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], acc);

  var count = 0;
  for (var i = 0; () {return i < 10;} (); i++) ++count;
  Expect.equals(10, count);

  var list = [1, 2, 3, 4, 5];
  var anotherList = [];
  for (var x in list) {
    anotherList.add(() {return x;} ());
  }
  Expect.listEquals(list, anotherList);
}
