/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An if element:
 * ...
 * It is a compile-time error if the condition evaluates to false and the else
 * expression, if it exists, is not a constant expression.
 *
 * @description Checks that it is not a compile-time error if the condition
 * evaluates to false and the else expression is a constant expression while
 * the if expression is a potentially constant expression.
 * @author ngl@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  const t = false;
  List<int> list1 = const [if (t) (null as String).length else 1, 11];
  Expect.listEquals([1, 11], list1);
  const List<int> list2 = [if (t) (null as String).length + 1 else 2, 12];
  Expect.listEquals([2, 12], list2);
  var list3 = const [if (t) (null as String).length + 2 else 3, 13];
  Expect.listEquals([3, 13], list3);
  var list4 = const <int>[if (t) (null as String).length + 3 else 4, 14];
  Expect.listEquals([4, 14], list4);
  const list5 = [if (t) (null as String).length + 4 else 5, 15];
  Expect.listEquals([5, 15], list5);

  Set<int> set1 = const {if (t) (null as String).length else 1, -1};
  Expect.setEquals({1, -1}, set1);
  const Set<int> set2 = {if (t) (null as String).length else 2, -2};
  Expect.setEquals({2, -2}, set2);
  var set3 = const {if (t) (null as String).length else 3, -3};
  Expect.setEquals({3, -3}, set3);
  var set4 = const <int>{if (t) (null as String).length else 4, -4};
  Expect.setEquals({4, -4}, set4);
  const set5 = {if (t) (null as String).length else 5, -5};
  Expect.setEquals({5, -5}, set5);

  Map<int, String> map1 = const {if (t) (null as String).length: "1x", 11: "x1"};
  Expect.mapEquals({11: "x1"}, map1);
  const Map<int, String> map2 = {if (t) (null as String).length + 1: "2x", 12: "x2"};
  Expect.mapEquals({12: "x2"}, map2);
  var map3 = const {if (t) (null as String).length - 1: "3x", 13: "x3"};
  Expect.mapEquals({13: "x3"}, map3);
  var map4 = const <int, String>{if (t) (null as String).length + 3: "4x", 14: "x4"};
  Expect.mapEquals({14: "x4"}, map4);
  const map5 = {if (t) (null as String).length - 2: "5x", 15: "x5"};
  Expect.mapEquals({15: "x5"}, map5);
}
