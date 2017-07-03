/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String join([String separator = ""])
 * Converts each element to a String and concatenates the strings.
 * Iterates through elements of this iterable, converts each one to a String by
 * calling Object.toString, and then concatenates the strings, with the
 * separator string interleaved between the elements.
 * @description Checks that if [separator] is omitted, elements of [this] are
 * not separated in the returned String.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<int> list, String expectedString) {
  var l = new Uint64List.fromList(list);
  var s = l.join();
  Expect.stringEquals(expectedString, s);
}

main() {
  check([],  "");
  check([1, 2], "12");
  check([1, 2, 3, 4, 5, 6, 7, 8, 9],"123456789");
}
