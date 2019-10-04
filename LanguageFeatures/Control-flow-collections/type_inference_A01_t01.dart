/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a list literal has a downwards inference type of List<T> for
 * some T, then the downwards inference context type of the body elements is T.
 *
 * @description Checks that if a list literal has a downwards inference type of
 * List<T> for some T, then the downwards inference context type of the body
 * elements is T.
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

class C {}

main() {
  List<List<String>> list1 = [
    if (true) [],
    if (false) [] else [],
    for (var i = 0; i < 1; i++) []
  ];
  Expect.isTrue(list1 is List<List<String>>);
  Expect.listEquals([[], [], []], list1);

  var list2 = <List<int>> [
    if (true) [],
    if (false) [] else [],
    for (var i = 0; i < 1; i++) []
  ];
  Expect.isTrue(list2 is List<List<int>>);
  Expect.listEquals([[], [], []], list2);

  var list3 = const <List<String>> [
    if (true) [],
    if (false) [] else [],
  ];
  Expect.isTrue(list3 is List<List<String>>);
  Expect.listEquals([[], []], list3);

  const list4 = <List<C>> [
    if (true) [],
    if (false) [] else []
  ];
  Expect.isTrue(list4 is List<List<C>>);
  Expect.listEquals([[], []], list4);
}
