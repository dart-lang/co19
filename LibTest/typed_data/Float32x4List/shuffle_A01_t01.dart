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

pack(x, y, z, w) => new Float32x4(x, y, z, w);

equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}

bool isOrderChanged(List<Float32x4> list, Float32x4List sl) {
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
  List<Float32x4> list = [
    pack(1.0, 2.0, 3.0, 4.0), pack(2.0, 3.0, 4.0, 5.0),
    pack(3.0, 4.0, 5.0, 6.0), pack(4.0, 5.0, 6.0, 7.0),
    pack(5.0, 6.0, 7.0, 8.0), pack(6.0, 7.0, 8.0, 9.0),
    pack(7.0, 8.0, 9.0, 10.0), pack(8.0, 9.0, 10.0, 11.0),
    pack(9.0, 10.0, 11.0, 12.0), pack(10.0, 11.0, 12.0, 13.0)
  ];
  var counter = 0;
  for (int i = 0; i < 10; i++) {
    var sl = new Float32x4List.fromList(list);
    sl.shuffle();
    if (!isOrderChanged(list, sl)) {
      counter++;
    }
  }
  /* We allow a couple of shuffles return data in the same order */
  Expect.isTrue(counter < 3);
}
