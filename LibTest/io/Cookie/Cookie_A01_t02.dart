/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Cookie(String name, String value)
 * Creates a new cookie setting the name and value.
 * By default the value of httpOnly will be set to true.
 * @description Checks that it is runtime error if cookie value is invalid (see
 * https://tools.ietf.org/html/rfc6265)
 * @issue 29463
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

const invalidCharacters = [0x20, 0x22, 0x2C, 0x3B, 0x5C, 0x7F];

main() {
  Expect.throws(() {new Cookie("cname", '"');});
  Expect.throws(() {new Cookie("cname", 'v"v');});
  Expect.throws(() {new Cookie("cname", '"v');});
  Expect.throws(() {new Cookie("cname", 'v"');});
  Expect.throws(() {new Cookie("cname", 's"s');});
  for (int charCode in invalidCharacters) {
    String v = new String.fromCharCode(charCode);
    Expect.throws(() {new Cookie("cname", v);}, null,
        "Exception expected for character $v ($charCode)");
  }
}
