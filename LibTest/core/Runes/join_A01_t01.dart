/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String join([String separator = ""])
 * Converts each element to a [String] by calling Object.toString on it.
 * Then concatenates the strings, optionally separated by the [separator] string.
 * @description Checks that the returned [String] contains all elements from
 * [this] separated by [separator].
 * @author msyabro
 */
import "../../../Utils/expect.dart";

check(string, separator, expectedString) {
  var runes = new Runes(string);
  var s = runes.join(separator);
  Expect.stringEquals(expectedString, s);
}

main() {
  check('', '', '');
  check('', ', ', '');
  check('\x01', ', ', '1');
  check('\x01\x02\x03\x04\x05\x06\x07\x08\x09', "  ",
      "1  2  3  4  5  6  7  8  9");
}
