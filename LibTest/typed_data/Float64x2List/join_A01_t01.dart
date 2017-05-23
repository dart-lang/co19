/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String join([String separator = "" ])
 * Converts each element to a String and concatenates the strings.
 * Iterates through elements of this iterable, converts each one to a String by
 * calling Object.toString, and then concatenates the strings, with the
 * separator string interleaved between the elements.
 * @description Checks that the correct value is returned.
 * @author ngl@unipro.ru
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float64x2 f64x2(v) => new Float64x2.splat(v);

void check(List<Float64x2> list, String separator, String expected) {
  var l = new Float64x2List.fromList(list);
  var res = l.join(separator);
  Expect.equals(expected, res);
}

main() {
  check([], "", "");
  check([], ", ", "");
  check([f64x2(1.0)], "", "[1.000000, 1.000000]");
  check([f64x2(1.0)], ", ", "[1.000000, 1.000000]");
  check([f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0), f64x2(5.0)], "",
      "[1.000000, 1.000000][2.000000, 2.000000][3.000000, 3.000000]"
      "[4.000000, 4.000000][5.000000, 5.000000]"
  );
  check([f64x2(1.0), f64x2(2.0), f64x2(3.0), f64x2(4.0), f64x2(5.0)], " ",
      "[1.000000, 1.000000] [2.000000, 2.000000] [3.000000, 3.000000] "
      "[4.000000, 4.000000] [5.000000, 5.000000]"
  );
}
