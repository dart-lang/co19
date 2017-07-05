/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void shuffle([Random random])
 * Shuffles the elements of this list randomly.
 * @description Checks that [this] is shuffled randomly.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "dart:math";
import "../../../Utils/expect.dart";

f64x2(x, y) => new Float64x2(x, y);

check(List<Float64x2> list, Float64x2List sl) {
  Expect.equals(list.length, sl.length);
  bool p1 = false;
  bool p2 = true;
  for (int i = 0; i < list.length; i++) {
    for (int j = 0; j < list.length; j++) {
      if (list[i].x == sl[j].x && list[i].y == sl[j].y) {
        p1 = true;
        if (i != j) p2 = false;
        break;
      }
    }
    Expect.isTrue(p1, "Element ${list[i]} is not in sl");
  }
  Expect.isFalse(p2, "sl wasn't shuffled");
}

main() {
  var list = [
    f64x2(1.0, 2.0), f64x2(2.0, 3.0), f64x2(3.0, 4.0), f64x2(4.0, 5.0),
    f64x2(5.0, 6.0)
  ];
  var sl = new Float64x2List.fromList(list);
  sl.shuffle();
  check(list, sl);

  sl = new Float64x2List.fromList(list);
  sl.shuffle(new Random());
  check(list, sl);

  sl = new Float64x2List.fromList(list);
  sl.shuffle(new Random(6));
  check(list, sl);
}
