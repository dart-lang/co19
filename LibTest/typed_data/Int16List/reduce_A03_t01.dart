/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E reduce(E combine(E value, E element))
 * ...
 * If it has only one element, that element is returned.
 * @description Checks that the returned value is correct.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<int> list) {
  var l = new Int16List.fromList(list);
  var res = l.reduce((prev, cur) => prev + cur);
  Expect.equals(list[0], res);
}

checkConst(List<int> list) {
  var l = new Int16List.fromList(list);
  var res = l.reduce((prev, cur) => 1);
  Expect.equals(list[0], res);
}

main() {
  check([1]);
  check([10]);

  checkConst([3]);
}
