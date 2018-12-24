/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void shuffle([Random random])
 * Shuffles the elements of this list randomly.
 * @description Checks that this method shuffles the elements of this list
 * randomly.
 * @author sgrekhov@unipro.ru
 */
library shuffle_A01_t01;

import "../../../Utils/expect.dart";

bool isOrderChanged(List list, List sl) {
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


test(List create([int length])) {
  List initial = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  var counter = 0;
  for (int i = 0; i < 10; i++) {
    var sl = create();
    sl.addAll(initial);
    sl.shuffle();

    if (!isOrderChanged(initial, sl)) {
      counter++;
    }
  }
  /* We allow a couple of shuffles return data in the same order */
  Expect.isTrue(counter < 3);
}
