/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An if element:
 * ...
 * It is a compile-time error if the condition evaluates to true and the then
 * expression is not a constant expression.
 *
 * @description Checks that it is not a compile-time error if the condition
 * evaluates to true and the then expression is a constant expression while
 * the else expression a potentially constant expression.
 * @author ngl@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  const t = true;
  const int x = 1;
  List<int> list1 = const [if (t) x else (null as String).length, 2];
  Expect.listEquals([1, 2], list1);
  const List<int> list2 = [if (t) x + 1 else (null as String).length, x];
  Expect.listEquals([2, 1], list2);
  var list3 = const [if (t) x else (null as String).length, 1];
  Expect.listEquals([1, 1], list3);
  var list4 = const <int>[if (t) x else (null as String).length, 3];
  Expect.listEquals([1, 3], list4);
  const list5 = [if (t) x else (null as String).length, 2];
  Expect.listEquals([1, 2], list5);

  Set<int> set1 = const {if (t) x else (null as String).length, -1};
  Expect.setEquals({1, -1}, set1);
  const Set<int> set2 = {if (t) x - 1 else (null as String).length + 10, -1};
  Expect.setEquals({0, -1}, set2);
  var set3 = const {if (t) x else (null as String).length + 12, -1};
  Expect.setEquals({1, -1}, set3);
  var set4 = const <int>{if (t) x + 1 else (null as String).length + 13, -1};
  Expect.setEquals({2, -1}, set4);
  const set5 = {if (t) x, -1};
  Expect.setEquals({1, -1}, set5);

  Map<int, String> map1 = const {if (t) x - 1: "0" else (null as String).length: "y1"};
  Expect.mapEquals({0: "0"}, map1);
  const Map<int, String> map2 = {if (t) x: "1" else (null as String).length: "y2"};
  Expect.mapEquals({1: "1"}, map2);
  var map3 = const {if (t) x + 1: "2" else (null as String).length: "y3"};
  Expect.mapEquals({2: "2"}, map3);
  var map4 = const <int, String>{if (t) x: "x" else (null as String).length: "y4"};
  Expect.mapEquals({1: "x"}, map4);
  const map5 = {if (t) x + 2: "3" else (null as String).length: "y5"};
  Expect.mapEquals({3: "3"}, map5);
}
