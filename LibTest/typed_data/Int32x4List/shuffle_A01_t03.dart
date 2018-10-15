/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void shuffle([Random random])
 * Shuffles the elements of this list randomly.
 * @description Checks that use of the same Random seed produces the same
 * shuffle
 * @author sgrekhov@unipro.ru
 */
import "dart:typed_data";
import "dart:math";
import "../../../Utils/expect.dart";

i32x4p(n) => new Int32x4(n, n + 1, n + 2, n + 3);

equal(o1, o2) {
  return o1.x == o2.x && o1.y == o2.y && o1.z == o2.z && o1.w == o2.w;
}

main() {
  List<Int32x4> list = [i32x4p(1), i32x4p(2), i32x4p(3), i32x4p(4), i32x4p(5),
      i32x4p(6)];
  var shuffled1 = new Int32x4List.fromList(list);
  shuffled1.shuffle(new Random(6));
  var shuffled2 = new Int32x4List.fromList(list);
  shuffled2.shuffle(new Random(6));

  Expect.equals(shuffled1.length, shuffled2.length);
  for (int i = 0; i < shuffled1.length; i++) {
    Expect.isTrue(equal(shuffled1[i], shuffled2[i]));
  }
}
