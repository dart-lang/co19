// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion String join([String separator = ""])
/// Converts each element to a String and concatenates the strings.
/// Iterates through elements of this iterable, converts each one to a String by
/// calling Object.toString, and then concatenates the strings, with the
/// separator string interleaved between the elements.
/// @description Checks that if [separator] is omitted, elements of [this]
/// are not separated in the returned String.
/// @author msyabro


import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<double> list, String expectedString) {
  var l = new Float64List.fromList(list);
  var s = l.join();
  Expect.stringEquals(expectedString, s);
}

main() {
  check([],  "");
  check([0.25, 1.1], "0.251.1");
  check([1.1, 2.1, 3.1, 4.1, 5.1, 6.1, 7.1, 8.1, 9.1],
      "1.12.13.14.15.16.17.18.19.1");
}
