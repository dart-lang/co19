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

pack(x, y, z, w) => new Float32x4(x, y, z, w);

equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}

check(List<Float32x4> list, Float32x4List sl) {
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
  var list = [
    pack(1.0, 2.0, 3.0, 4.0), pack(2.0, 3.0, 4.0, 5.0),
    pack(3.0, 4.0, 5.0, 6.0), pack(4.0, 5.0, 6.0, 7.0),
    pack(5.0, 6.0, 7.0, 8.0)
  ];
  var sl = new Float32x4List.fromList(list);
  sl.shuffle();
  check(list, sl);

  sl = new Float32x4List.fromList(list);
  sl.shuffle(new Random());
  check(list, sl);

  sl = new Float32x4List.fromList(list);
  sl.shuffle(new Random(6));
  check(list, sl);
}
