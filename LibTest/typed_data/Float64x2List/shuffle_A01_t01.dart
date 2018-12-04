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

f64x2(x, y) => new Float64x2(x, y);

bool isOrderChanged(List<Float64x2> list, Float64x2List sl) {
  Expect.equals(list.length, sl.length);
  bool moved = false;
  for (int i = 0; i < list.length; i++) {
    bool found = false;
    for (int j = 0; j < list.length; j++) {
      if (list[i].x == sl[j].x && list[i].y == sl[j].y) {
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
  List<Float64x2> list = [
    f64x2(1.0, 2.0), f64x2(2.0, 3.0), f64x2(3.0, 4.0), f64x2(4.0, 5.0),
    f64x2(5.0, 6.0), f64x2(6.0, 7.0), f64x2(7.0, 8.0), f64x2(8.0, 9.0),
    f64x2(9.0, 10.0), f64x2(10.0, 11.0)
  ];

  var counter = 0;
  for (int i = 0; i < 10; i++) {
    var sl = new Float64x2List.fromList(list);
    sl.shuffle();
    if (!isOrderChanged(list, sl)) {
      counter++;
    }
  }
  /* We allow a couple of shuffles return data in the same order */
  Expect.isTrue(counter < 3);
}
