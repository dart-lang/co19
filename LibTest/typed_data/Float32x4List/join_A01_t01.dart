// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion String join([String separator = ""])
/// Converts each element to a [String] and concatenates the strings.
/// Iterates through elements of this iterable, converts each one to a [String]
/// by calling Object.toString, and then concatenates the strings, with the
/// [separator] string interleaved between the elements.
/// @description Checks that the returned [String] contains all elements from
/// [this] separated by [separator].
/// @author msyabro
/// @issue 43267


import "dart:typed_data";
import "../../../Utils/expect.dart";

Float32x4 pack(v) => new Float32x4.splat(v);

check(List<Float32x4> list, String separator, String expectedString) {
  var l = new Float32x4List.fromList(list);
  var s = l.join(separator);
  Expect.stringEquals(expectedString, s);
}

main() {
  check([], "", "");
  check([], ", ", "");
  if (isJS) {
    check([pack(1.25)], ", ", "[1.25, 1.25, 1.25, 1.25]");
    check(
        [
          pack(1.25), pack(2.25), pack(3.25), pack(4.25),
          pack(5.25), pack(6.25), pack(7.25), pack(8.25),
          pack(9.25)
        ],
          "  ",
          "[1.25, 1.25, 1.25, 1.25]  "
          "[2.25, 2.25, 2.25, 2.25]  "
          "[3.25, 3.25, 3.25, 3.25]  "
          "[4.25, 4.25, 4.25, 4.25]  "
          "[5.25, 5.25, 5.25, 5.25]  "
          "[6.25, 6.25, 6.25, 6.25]  "
          "[7.25, 7.25, 7.25, 7.25]  "
          "[8.25, 8.25, 8.25, 8.25]  "
          "[9.25, 9.25, 9.25, 9.25]");
  } else {
    check([pack(1.25)], ", ", "[1.250000, 1.250000, 1.250000, 1.250000]");
    check(
        [
          pack(1.25), pack(2.25), pack(3.25), pack(4.25),
          pack(5.25), pack(6.25), pack(7.25), pack(8.25),
          pack(9.25)
        ],
        "  ",
        "[1.250000, 1.250000, 1.250000, 1.250000]  "
            "[2.250000, 2.250000, 2.250000, 2.250000]  "
            "[3.250000, 3.250000, 3.250000, 3.250000]  "
            "[4.250000, 4.250000, 4.250000, 4.250000]  "
            "[5.250000, 5.250000, 5.250000, 5.250000]  "
            "[6.250000, 6.250000, 6.250000, 6.250000]  "
            "[7.250000, 7.250000, 7.250000, 7.250000]  "
            "[8.250000, 8.250000, 8.250000, 8.250000]  "
            "[9.250000, 9.250000, 9.250000, 9.250000]");
  }
}
