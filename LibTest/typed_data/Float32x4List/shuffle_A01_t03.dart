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

pack(x, y, z, w) => new Float32x4(x, y, z, w);
equal(obj1, obj2) {
  var res = obj1.equal(obj2);
  return res.flagX && res.flagY && res.flagZ && res.flagW;
}

main() {
  List<Float32x4> list = [
    pack(1.0, 2.0, 3.0, 4.0), pack(2.0, 3.0, 4.0, 5.0),
    pack(3.0, 4.0, 5.0, 6.0), pack(4.0, 5.0, 6.0, 7.0),
    pack(5.0, 6.0, 7.0, 8.0)
  ];
  var shuffled1 = new Float32x4List.fromList(list);
  shuffled1.shuffle(new Random(6));
  var shuffled2 = new Float32x4List.fromList(list);
  shuffled2.shuffle(new Random(6));

  Expect.equals(shuffled1.length, shuffled2.length);
  for (int i = 0; i < shuffled1.length; i++) {
    Expect.isTrue(equal(shuffled1[i], shuffled2[i]));
  }
}
