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
 * @description Checks that the expansion is the then element if the condition
 * expression evaluates to true.
 * @author ngl@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  const t = true;
  const int x = 1;
  List<int> list1 = const [if (t) x else x + 10, 2];
  Expect.listEquals([1, 2], list1);
  const List<int> list2 = [if (t) x + 1 else x + 11, x];
  Expect.listEquals([2, 1], list2);
  var list3 = const [if (t) x else x + 12, 1];
  Expect.listEquals([1, 1], list3);
  var list4 = const <int>[if (t) x else x + 13, 3];
  Expect.listEquals([1, 3], list4);
  const list5 = [if (t) x else x + 14, 2];
  Expect.listEquals([1, 2], list5);

  Set<int> set1 = const {if (t) x else x + 10, -1};
  Expect.setEquals({1, -1}, set1);
  const Set<int> set2 = {if (t) x - 1 else x + 11, -1};
  Expect.setEquals({0, -1}, set2);
  var set3 = const {if (t) x else x + 12, -1};
  Expect.setEquals({1, -1}, set3);
  var set4 = const <int>{if (t) x + 1 else x + 13, -1};
  Expect.setEquals({2, -1}, set4);
  const set5 = {if (t) x else x + 14, -1};
  Expect.setEquals({1, -1}, set5);

  Map<int, String> map1 = const {if (t) x - 1: "0" else x + 10: "11"};
  Expect.mapEquals({0: "0"}, map1);
  const Map<int, String> map2 = {if (t) x: "1" else x + 11: "12"};
  Expect.mapEquals({1: "1"}, map2);
  var map3 = const {if (t) x + 1: "2" else x + 12: "13"};
  Expect.mapEquals({2: "2"}, map3);
  var map4 = const <int, String>{if (t) x: "x" else x + 13: "14"};
  Expect.mapEquals({1: "x"}, map4);
  const map5 = {if (t) x + 2: "3" else x + 14: "15"};
  Expect.mapEquals({3: "3"}, map5);
}
