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

i32x4p(n) => new Int32x4(n, n + 1, n + 2, n + 3);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

check(List<Int32x4> list, Int32x4List sl) {
  Expect.equals(list.length, sl.length);
  bool p1 = false;
  bool p2 = true;
  for (int i = 0; i < list.length; i++) {
    for (int j = 0; j < list.length; j++) {
      if (equal(list[i], sl[j]))  {
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
  var list = [i32x4p(1), i32x4p(2), i32x4p(3), i32x4p(4), i32x4p(5)];
  var sl = new Int32x4List.fromList(list);
  sl.shuffle();
  check(list, sl);

  sl = new Int32x4List.fromList(list);
  sl.shuffle(new Random());
  check(list, sl);

  sl = new Int32x4List.fromList(list);
  sl.shuffle(new Random(6));
  check(list, sl);
}
