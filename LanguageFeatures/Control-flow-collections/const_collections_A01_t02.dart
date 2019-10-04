/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An expression element (the base case in lists and sets):
 *
 *  It is a compile-time error if the expression is not a constant expression.
 *  The expansion is the value of the expression.
 *
 * @description Checks that the expansion is the value of the expression
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  const x = 3;

  List<int> list1 = const [if (1 > 0) 1, 1 ];
  Expect.listEquals([1, 1], list1);
  List<int> list2 = const [if (1 > 0) x, 2 ];
  Expect.listEquals([x, 2], list2);
  const List<int> list3 = [if (-1 > 0) 1, 1 ];
  Expect.listEquals([1], list3);
  const List<int> list4 = [if (1 > 0) 1, if (false) -1 ];
  Expect.listEquals([1], list4);
  var list5 = const [if (x > 0) 1, 5 + 1, ];
  Expect.listEquals([1, 6], list5);
  var list6 = const [if (1 > 0) x, 1, ];
  Expect.listEquals([x, 1], list6);
  var list7 = const <int>[if (x > 0) x, 7, ];
  Expect.listEquals([x, 7], list7);
  var list8 = const <int>[if (1 > 0) x, 8, ];
  Expect.listEquals([x, 8], list8);
  const list9 = [if (x > 0) 1 + 1, 1 ];
  Expect.listEquals([2, 1], list9);
  const list10 = [if (1 > 0) x + x, 1 + 7];
  Expect.listEquals([x + x, 8], list10);

  Set<int> set1 = const {if (x > 0) 1, -1 };
  Expect.setEquals({1, -1}, set1);
  Set<int> set2 = const {if (1 > 0) x, 1 - 1 };
  Expect.setEquals({x, 0}, set2);
  const Set<int> set3 = {if (x > 0) 1, -1 };
  Expect.setEquals({1, -1}, set3);
  const Set<int> set4 = {if (-1 > 0) x, -1 };
  Expect.setEquals({-1}, set4);
  var set5 = const {if (x > 0) 1, -1, };
  Expect.setEquals({1, -1}, set5);
  var set6 = const {if (1 > 0) x, -1, };
  Expect.setEquals({x, -1}, set6);
  var set7 = const <int>{if (x > 0) 1, -1, };
  Expect.setEquals({1, -1}, set7);
  var set8 = const <int>{if (1 > 0) x, -1, };
  Expect.setEquals({x, -1}, set8);
  const set9 = {if (x > 0) 1, -1 };
  Expect.setEquals({1, -1}, set9);
  const set10 = {if (1 > 0) x, -1 };
  Expect.setEquals({x, -1}, set10);
}
