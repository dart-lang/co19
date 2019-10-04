/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Each element in a list can be one of a few things:
 *  A normal expression.
 *  An if element.
 *  A for element.
 *  The body of if and for elements use listElement, not expression, which
 *  allows nesting.
 *
 * @description Checks that each element in the list can be a normal expression,
 * 'if' element or 'for' element
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  bool b = true;
  List<int> listInt = [
    3, 1, 4,
    if (b) 1,
    if (!b) 1,
    for (int i = 5; i < 10; i++) i
  ];
  Expect.listEquals([3, 1, 4, 1, 5, 6, 7, 8, 9], listInt);

  Expect.listEquals([], [
    if (false) "x",
    for (int i = 0; i < -1; i++) "y"
  ]);

  List<String> collection = ["not", "to", "be"];
  List listString = <String>[
    "T", "o", "b", "e",
    if (b) "or",
    if (!b) "and",
    for (var v in collection) v
  ];
  Expect.listEquals(["T", "o", "b", "e", "or", "not", "to", "be"], listString);

  const constList = const <int>[
    3, 1, 4,
    if (1 > 2) 5,
    if (2 > 1) 1,
    5
  ];
  Expect.listEquals([3, 1, 4, 1, 5], constList);
}
