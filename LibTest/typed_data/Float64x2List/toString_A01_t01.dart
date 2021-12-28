// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion String toString()
/// Returns a string representation of this object.
/// @description Checks that the returned String is correct.
/// @author ngl@unipro.ru

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

check(List<Float64x2> list, String expected) {
  var l = new Float64x2List.fromList(list);
  var res = l.toString();
  Expect.isTrue(res is String);
  Expect.runtimeIsType<String>(res);
  Expect.equals(expected, res);
}

main() {
  check([], "[]");
  check([f64x2(6.123456), f64x2(1.123456), f64x2(4.123456)],
      "[[6.123456, 6.123456], [1.123456, 1.123456], [4.123456, 4.123456]]");
  check([f64x2(1.123456), f64x2(2.123456), f64x2(2.123456), f64x2(4.123456)],
      "[[1.123456, 1.123456], [2.123456, 2.123456], [2.123456, 2.123456], "
      "[4.123456, 4.123456]]");
}
