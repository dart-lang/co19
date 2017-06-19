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

check(List<int> list, Int64List sl) {
  Expect.equals(list.length, sl.length);

  bool p = true;
  for (int i = 0; i < list.length; i++) {
    Expect.isTrue(sl.contains(list[i]), "Element ${list[i]} is not in sl");
    if (sl[i] != list[i]) p = false;
  }
  Expect.isFalse(p, "sl wasn't shuffled");
}

main() {
  List<int> list = [0, 1, 2, 3, 4, 5];
  var sl = new Int64List.fromList(list);
  sl.shuffle();
  check(list, sl);

  sl = new Int64List.fromList(list);
  sl.shuffle(new Random());
  check(list, sl);

  sl = new Int64List.fromList(list);
  sl.shuffle(new Random(6));
  check(list, sl);
}
