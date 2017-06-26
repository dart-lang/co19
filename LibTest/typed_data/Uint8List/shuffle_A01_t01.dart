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

check(List<int> list, Uint8List sl) {
  Expect.equals(list.length, sl.length);
  bool p1 = false;
  bool p2 = true;
  for (int i = 0; i < list.length; i++) {
    for (int j = 0; j < list.length; j++) {
      if (list[i] == sl[j]) {
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
  var list = [1, 2, 3, 4, 5, 6];
  var sl = new Uint8List.fromList(list);
  sl.shuffle();
  check(list, sl);

  sl = new Uint8List.fromList(list);
  sl.shuffle(new Random());
  check(list, sl);

  sl = new Uint8List.fromList(list);
  sl.shuffle(new Random(6));
  check(list, sl);
}
