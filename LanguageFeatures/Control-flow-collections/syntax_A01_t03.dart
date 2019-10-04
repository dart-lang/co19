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
 * 'if' element or 'await for' element
 * @author sgrekhov@unipro.ru
 */
import "dart:async";
import "../../Utils/expect.dart";

Stream<int> stream =  Stream<int>.fromIterable([1, 2, 3]);
Stream<int> stream2 =  Stream<int>.fromIterable([4, 5, 6]);

main() async {
  bool b = true;

  List<int> listInt = [
    3, 1, 4,
    if (b) await for (var v in stream) v + 1,
    if (!b) 1,
    await for (var i in stream2) if (!i.isEven) i
  ];
  Expect.listEquals([3, 1, 4, 2, 3, 4, 5], listInt);
}
