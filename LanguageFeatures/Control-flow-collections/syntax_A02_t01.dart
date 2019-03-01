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
 * 'if' element or 'for' element
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=control-flow-collections
import "../../Utils/expect.dart";

main() {
  bool b = true;
  Map<int, String> map1 = {
    0: "0",
    if (b) 1: "1",
    if (!b) 2 : "2",
    for (int i = 5; i < 9; i++) i: "$i"
  };
  Expect.mapEquals({0: "0", 1: "1", 5: "5", 6: "6", 7: "7", 8: "8"}, map1);

  Expect.mapEquals({}, {
    if (false) 0: "x",
    for (int i = 0; i < -1; i++) 1: "y"
  });

  Map<String, String> collection = {"x": "not", "y": "to", "z": "be"};
  Map map2 = <String, String>{
    "0": "To",
    "1": "be",
    if (b) "2": "or",
    if (!b) "3": "and",
    for (var v in collection) v
  };
  Expect.mapEquals({
    "0": "To",
    "1": "be",
    "2": "or",
    "x": "not",
    "y": "to",
    "z": "be"
  }, map2);

  const constMap = const <int, String>{
    0: "0",
    if (1 >  2) 1: "1",
    if (2 > 1)  2: "2",
    3: "3"
  };
  Expect.mapEquals({0: "0", 1: "1", 3: "3"}, constMap);
}
