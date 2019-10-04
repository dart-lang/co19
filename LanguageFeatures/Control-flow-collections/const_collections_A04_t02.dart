/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An if element:
 * ...
 * It is a compile-time error if the then and else branches are not potentially
 * const expressions. The "potentially const" is to allow a the unchosen branch
 * to throw an exception. In other words, if elements short-circuit.
 *
 * @description Checks that it is allowed the unchosen branch to throw an
 * exception
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  const t = true;
  List<int> list1 = const [if (t) 2 else (null as String).length ];
  Expect.listEquals([2], list1);

  const List<int> list2 = [if (!t) (null as String).length else 2 ];
  Expect.listEquals([2], list2);

  var list3 = const [if (!t) (null as String).length else 2, ];
  Expect.listEquals([2], list3);

  var list4 = const <int>[if (t) 2 else (null as String).length, ];
  Expect.listEquals([2], list4);

  const list5 = [if (t) 2 else (null as String).length ];
  Expect.listEquals([2], list5);

  Set<int> set1 = const {if (!t) (null as String).length else 2, -1 };
  Expect.setEquals({2, -1}, set1);

  const Set<int> set2 = {if (t) 2 else (null as String).length, -1 };
  Expect.setEquals({2, -1}, set2);

  var set3 = const {if (!t) (null as String).length else 2, -1, };
  Expect.setEquals({2, -1}, set3);

  var set4 = const <int>{if (t) 2 else (null as String).length, -1, };
  Expect.setEquals({2, -1}, set4);

  const set5 = {if (t) 2 else (null as String).length, -1 };
  Expect.setEquals({2, -1}, set5);

  Map<int, String> map1 = const {if (t) 2: "1" else (null as String).length: "x"};
  Expect.mapEquals({2: "1"}, map1);

  const Map<int, String> map2 = {if (!t) (null as String).length: "x" else 2: "1"};
  Expect.mapEquals({2: "1"}, map2);

  var map3 = const {if (t) 2: "x" else (null as String).length: "1"};
  Expect.mapEquals({2: "x"}, map3);

  var map4 = const <int, String>{if (t) 2: "x" else (null as String).length: "1"};
  Expect.mapEquals({2: "x"}, map4);

  const map5 = {if (t) 2: "x" else (null as String).length: "1"};
  Expect.mapEquals({2: "x"}, map5);
}
