/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Object convert(String input)
 * Throws FormatException if the input is not valid JSON text.
 * @description checks that this method throws when a syntax error
 * in input string is encountered.
 * @author kaigorodov
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "table3.lib.dart" show table;

main() {
  for (String source in table) {
    JsonDecoder jdec = new JsonDecoder(null);
    Expect.throws((){
        jdec.convert(source);
      }, (e) => e is FormatException, "Bad string $source parsed");
  }
}
