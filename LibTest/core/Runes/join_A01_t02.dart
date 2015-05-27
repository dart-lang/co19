/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String join([String separator = ""])
 * Converts each element to a String and concatenates the strings.
 * Converts each element to a String by calling Object.toString on it.
 * Then concatenates the strings, optionally separated by the separator string.
 * @description Checks that if [separator] is omitted, elements of [this]
 * are not separated in the returned String.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

check(string, expectedString) {
  var runes = new Runes(string);
  var s = runes.join();
  Expect.stringEquals(expectedString, s);
}

main() {
  check('',  '');
  check('\x01\x02', '12');
  check('\x01\x02\x03\x04\x05\x06\x07\x08\x09', '123456789');
}
