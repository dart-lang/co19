/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void shuffle([Random random])
 * Shuffles the elements of this list randomly.
 * @description Checks that [this] is shuffled randomly. Use a Random seed
 * @author sgrekhov@unipro.ru
 */
import "dart:typed_data";
import "dart:math";
import "../../../Utils/expect.dart";

bool isOrderChanged(List<int> list, Uint8List sl) {
  Expect.equals(list.length, sl.length);
  bool moved = false;
  for (int i = 0; i < list.length; i++) {
    bool found = false;
    for (int j = 0; j < list.length; j++) {
      if (list[i] == sl[j]) {
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
  List<int> list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  var counter = 0;
  for (int i = 0; i < 10; i++) {
    var sl = new Uint8List.fromList(list);
    sl.shuffle(new Random());
    if (!isOrderChanged(list, sl)) {
      counter++;
    }
  }
  /* We allow a couple of shuffles return data in the same order */
  Expect.isTrue(counter < 3);
}
