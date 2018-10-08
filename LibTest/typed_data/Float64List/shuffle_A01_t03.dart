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

main() {
  List<double> list = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0];
  var shuffled1 = new Float64List.fromList(list);
  shuffled1.shuffle(new Random(6));
  var shuffled2 = new Float64List.fromList(list);
  shuffled2.shuffle(new Random(6));

  Expect.listEquals(shuffled1, shuffled2);
}
