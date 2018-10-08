/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String join([String separator = ""])
 * Converts each element to a [String] and concatenates the strings.
 * Iterates through elements of this iterable, converts each one to a [String]
 * by calling Object.toString, and then concatenates the strings, with the
 * [separator] string interleaved between the elements.
 * @description Checks that if [separator] is omitted, elements of [this]
 * are not separated in the returned String.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

check(List<Float32x4> list, String expectedString) {
  var l = new Float32x4List.fromList(list);
  var s = l.join();
  Expect.stringEquals(expectedString, s);
}

main() {
  check([],  "");
  check(
      [pack(.25), pack(1.0)],
      "[0.250000, 0.250000, 0.250000, 0.250000]"
      "[1.000000, 1.000000, 1.000000, 1.000000]");
  check(
      [
        pack(1.0), pack(2.0), pack(3.0), pack(4.0), pack(5.0), pack(6.0),
        pack(7.0), pack(8.0), pack(9.0)
      ],
      "[1.000000, 1.000000, 1.000000, 1.000000]"
      "[2.000000, 2.000000, 2.000000, 2.000000]"
      "[3.000000, 3.000000, 3.000000, 3.000000]"
      "[4.000000, 4.000000, 4.000000, 4.000000]"
      "[5.000000, 5.000000, 5.000000, 5.000000]"
      "[6.000000, 6.000000, 6.000000, 6.000000]"
      "[7.000000, 7.000000, 7.000000, 7.000000]"
      "[8.000000, 8.000000, 8.000000, 8.000000]"
      "[9.000000, 9.000000, 9.000000, 9.000000]");
}
