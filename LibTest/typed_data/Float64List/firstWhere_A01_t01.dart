/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E firstWhere(bool test(E element), {E orElse()})
 * Returns the first element that satisfies the given predicate [test].
 * @description Checks that the first element that satisfies the given
 * predicate is returned.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";


main() {
  var l = new Float64List.fromList([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 9.0]);
  var res = l.firstWhere((element) => element == 1.0);
  Expect.equals(1.0, res);

  res = l.firstWhere((element) => element > 6.0);
  Expect.equals(9.0, res);

  res = l.firstWhere((element) => element > 1.0);
  Expect.equals(2.0, res);
}
