/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Cookie(String name, String value)
 * Creates a new cookie setting the name and value.
 * By default the value of httpOnly will be set to true.
 * @description Checks that this constructor creates a new Cookie object. Test
 * character not allowed for cookie name (see
 * https://tools.ietf.org/html/rfc6265)
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

List<String> separators = ["(", ")","<", ">", "@", ",", ";", ":", r"\", '"',
  "/", "[", "]", "?", "=", "{", "}", " ", "\t"];

main() {
  List<String> invalidCharacters = [];
  /// CTL characters
  for (int i = 0; i < 32; i++) {
    invalidCharacters.add(new String.fromCharCode(i));
  }
  // Del
  invalidCharacters.add(new String.fromCharCode(127));
  // separators
  invalidCharacters.addAll(separators);

  for (int i = 0; i < invalidCharacters.length; i++) {
    Expect.throws(() {new Cookie(invalidCharacters[i], "");});
  }
}
