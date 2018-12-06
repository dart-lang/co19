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
 * @author sgrekhov@unipro.ru
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

i32x4p(n) => new Int32x4(n, n + 1, n + 2, n + 3);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

bool isOrderChanged(List<Int32x4> list, Int32x4List sl) {
  Expect.equals(list.length, sl.length);
  bool moved = false;
  for (int i = 0; i < list.length; i++) {
    bool found = false;
    for (int j = 0; j < list.length; j++) {
      if (equal(list[i], sl[j])) {
        found = true;
        if (i != j) moved = true;
        break;
      }
    }
    Expect.isTrue(found, "Element ${list[i]} not found in shuffled list");
  }
  return moved;
}

main() {
  List<Int32x4> list = [i32x4p(1), i32x4p(2), i32x4p(3), i32x4p(4), i32x4p(5),
                        i32x4p(6), i32x4p(7), i32x4p(8), i32x4p(9), i32x4p(10)];
  var counter = 0;
  for (int i = 0; i < 10; i++) {
    var sl = new Int32x4List.fromList(list);
    sl.shuffle();
    if (!isOrderChanged(list, sl)) {
      counter++;
    }
  }
  /* We allow a couple of shuffles return data in the same order */
  Expect.isTrue(counter < 3);
}
