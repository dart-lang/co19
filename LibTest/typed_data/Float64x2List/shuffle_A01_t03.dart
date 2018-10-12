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

f64x2(x, y) => new Float64x2(x, y);

main() {
  List<Float64x2> list = [
    f64x2(1.0, 2.0), f64x2(2.0, 3.0), f64x2(3.0, 4.0), f64x2(4.0, 5.0),
    f64x2(5.0, 6.0)
  ];
  var shuffled1 = new Float64x2List.fromList(list);
  shuffled1.shuffle(new Random(6));
  var shuffled2 = new Float64x2List.fromList(list);
  shuffled2.shuffle(new Random(6));

  Expect.equals(shuffled1.length, shuffled2.length);
  for (int i = 0; i < shuffled1.length; i++) {
    Expect.isTrue(shuffled1[i].x == shuffled2[i].x && shuffled1[i].y == shuffled2[i].y);
  }
}
