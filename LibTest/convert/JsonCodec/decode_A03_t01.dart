/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Object decode(String str, {reviver(key, value)})
 * Throws FormatException if the input is not valid JSON text.
 * @note undocumented
 * @description Checks that FormatException is thrown if the input is not valid
 * JSON text.
 * @author kaigorodov
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "../JsonDecoder/table3.lib.dart" show table;

main() {
  JsonCodec codec = new JsonCodec();
  
  for (String str in table) {
    Expect.throws(() {
      Object res = codec.decode(str);
    }, (e) => e is FormatException, "Bad string $str parsed");
  }
}
