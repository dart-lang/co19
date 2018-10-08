/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const JsonDecoder([reviver(key, value)])
 * Constructs a new JsonDecoder.
 * The reviver may be null.
 * @description Checks that this constructor creates decoder which works as
 * expected. Test constructor with no parameters or null
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(JsonDecoder decoder, String toDecode, var expected) {
  var decoded = decoder.convert(toDecode);
  Expect.deepEquals(expected, decoded);
}

main() {
  JsonDecoder decoder = new JsonDecoder();
  check(decoder, '{"a": 3}', {"a": 3});
  check(decoder, '{"b": 3.14}', {"b": 3.14});
  check(decoder, '{"c": true}', {"c": true});
  check(decoder, '["d", "e"]', ["d", "e"]);
  check(decoder, '{"f": {"g": "h"}}', {"f": {"g": "h"}});

  decoder = new JsonDecoder(null);
  check(decoder, '{"a": 3}', {"a": 3});
  check(decoder, '{"b": 3.14}', {"b": 3.14});
  check(decoder, '{"c": true}', {"c": true});
  check(decoder, '["d", "e"]', ["d", "e"]);
  check(decoder, '{"f": {"g": "h"}}', {"f": {"g": "h"}});
}
