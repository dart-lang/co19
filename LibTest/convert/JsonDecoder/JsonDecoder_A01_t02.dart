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
 * expected. Test constructor with reviver parameter
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

var reviverKeys = [];
var reviverValues = [];

reviver(key, value) {
  reviverKeys.add(key);
  reviverValues.add(value);
  return "x";
}

check(JsonDecoder decoder, String toDecode, List expKeys, List expValues) {
  reviverKeys = [];
  reviverValues = [];
  var decoded = decoder.convert(toDecode);
  Expect.equals("x", decoded);
  Expect.listEquals(expKeys, reviverKeys);
  Expect.listEquals(reviverValues, expValues);
}

main() {
  JsonDecoder decoder = new JsonDecoder(reviver);
  check(decoder, '{"a": 3}', ["a", null], [3, {"a": "x"}]);
  check(decoder, '{"b": 3.14}', ["b", null], [3.14, {"b": "x"}]);
  check(decoder, '{"c": true}', ["c", null], [true, {"c": "x"}]);

  check(decoder, '["d", "e"]', [0, 1, null], ["d", "e", ["x", "x"]]);
  check(decoder, '{"f": {"g": "h"}}',
      ["g", "f", null], ["h", {"g": "x"}, {"f": "x"}]);
  check(decoder, '["й", "ф"]', [0, 1, null], ["й", "ф", ["x", "x"]]);
  check(decoder, '{"й": "ф"}', ["й", null], ["ф", {"й": "x"}]);
}
