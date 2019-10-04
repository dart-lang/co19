/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Each element in a map can be one of a few things:
 *  A normal expression.
 *  An if element.
 *  A for element.
 *  The body of if and for elements use listElement, not expression, which
 *  allows nesting.
 *
 * @description Checks that each element in the map can be a normal expression,
 * 'if' element or 'for' element. Test combination of 'if' and 'for'
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  bool b = true;
  List<int> collection = [3, 1, 4, 1, 5];

  Map<String, int> map = {
    "-0": -3, "-1": -1, "-2": -4,
    if (b) for (var v in collection) "$v": v + 1,
    if (!b) "x": 1,
    for (int i = 15; i < 20; i++) if (i.isEven) "$i": i
  };
  Expect.mapEquals({
    "-0": -3,
    "-1": -1,
    "-2": -4,
    "3": 4,
    "1": 2,
    "4": 5,
    "5": 6,
    "16": 16,
    "18": 18}, map);
}
