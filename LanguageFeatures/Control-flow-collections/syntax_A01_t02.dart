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
 * 'if' element or 'for' element. Test combination of 'if' and 'for'
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() async {
  bool b = true;
  List<int> collection = [9, 8, 7, 6];

  List<int> listInt = [
    3, 1, 4,
    if (b) for (var v in collection) v + 1,
    if (!b) 1,
    for (int i = 5; i < 10; i++) if (i.isEven) i
  ];
  Expect.listEquals([3, 1, 4, 10, 9, 8, 7, 6, 8], listInt);
}
