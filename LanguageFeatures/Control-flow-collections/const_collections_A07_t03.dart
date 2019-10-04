/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An if element:
 * ...
 * The expansion is:
 * - The then element if the condition expression evaluates to true.
 * - The else element if the condition is false and there is one.
 * - Otherwise, the if element expands to nothing.
 *
 * @description Checks that if element expands to nothing if the condition
 * evaluates to false and the else expression is not exist.
 * @author ngl@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  const t = false;
  List<int> list1 = const [if (t) 1, 11];
  Expect.listEquals([11], list1);
  const List<int> list2 = [if (t) 2, 12];
  Expect.listEquals([12], list2);
  var list3 = const [if (t) 3, 13];
  Expect.listEquals([13], list3);
  var list4 = const <int>[if (t) 4, 14];
  Expect.listEquals([14], list4);
  const list5 = [if (t) 5, 15];
  Expect.listEquals([15], list5);

  Set<int> set1 = const {if (t) 1, -1};
  Expect.setEquals({-1}, set1);
  const Set<int> set2 = {if (t) 2, -2};
  Expect.setEquals({-2}, set2);
  var set3 = const {if (t) 3, -3};
  Expect.setEquals({-3}, set3);
  var set4 = const <int>{if (t) 4, -4};
  Expect.setEquals({-4}, set4);
  const set5 = {if (t) 5, -5};
  Expect.setEquals({-5}, set5);

  Map<int, String> map1 = const {if (t) 1: "1x", 11: "x1"};
  Expect.mapEquals({11: "x1"}, map1);
  const Map<int, String> map2 = {if (t) 2: "2x", 12: "x2"};
  Expect.mapEquals({12: "x2"}, map2);
  var map3 = const {if (t) 3: "3x", 13: "x3"};
  Expect.mapEquals({13: "x3"}, map3);
  var map4 = const <int, String>{if (t) 4: "4x", 14: "x4"};
  Expect.mapEquals({14: "x4"}, map4);
  const map5 = {if (t) 5: "5x", 15: "x5"};
  Expect.mapEquals({15: "x5"}, map5);
}
