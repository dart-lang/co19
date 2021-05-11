// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion String join([String separator = ""])
/// Converts each element to a [String] and concatenates the strings.
/// Iterates through elements of this iterable, converts each one to a [String]
/// by calling Object.toString, and then concatenates the strings, with the
/// [separator] string interleaved between the elements.
/// @description Checks that if [separator] is omitted, elements of [this]
/// are not separated in the returned String.
/// @author msyabro
/// @issue 43267


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
  if (isJS) {
    check(
        [pack(.25), pack(1.625)],
        "[0.25, 0.25, 0.25, 0.25]"
            "[1.625, 1.625, 1.625, 1.625]");
    check(
        [
          pack(1.25), pack(2.25), pack(3.25), pack(4.25),
          pack(5.25), pack(6.25), pack(7.25), pack(8.25),
          pack(9.25)
        ],
        "[1.25, 1.25, 1.25, 1.25]"
            "[2.25, 2.25, 2.25, 2.25]"
            "[3.25, 3.25, 3.25, 3.25]"
            "[4.25, 4.25, 4.25, 4.25]"
            "[5.25, 5.25, 5.25, 5.25]"
            "[6.25, 6.25, 6.25, 6.25]"
            "[7.25, 7.25, 7.25, 7.25]"
            "[8.25, 8.25, 8.25, 8.25]"
            "[9.25, 9.25, 9.25, 9.25]");
  } else {
    check(
        [pack(.25), pack(1.625)],
        "[0.250000, 0.250000, 0.250000, 0.250000]"
            "[1.625000, 1.625000, 1.625000, 1.625000]");
    check(
        [
          pack(1.123456), pack(2.123456), pack(3.123456), pack(4.123456),
          pack(5.123456), pack(6.123456), pack(7.123456), pack(8.123456),
          pack(9.123456)
        ],
        "[1.123456, 1.123456, 1.123456, 1.123456]"
            "[2.123456, 2.123456, 2.123456, 2.123456]"
            "[3.123456, 3.123456, 3.123456, 3.123456]"
            "[4.123456, 4.123456, 4.123456, 4.123456]"
            "[5.123456, 5.123456, 5.123456, 5.123456]"
            "[6.123456, 6.123456, 6.123456, 6.123456]"
            "[7.123456, 7.123456, 7.123456, 7.123456]"
            "[8.123456, 8.123456, 8.123456, 8.123456]"
            "[9.123456, 9.123456, 9.123456, 9.123456]");
  }
}
