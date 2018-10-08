/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory JsonCodec.withReviver(reviver(key, value))
 * Creates a JsonCodec with the given reviver.
 *
 * The reviver function is called once for each object or list property that has
 * been parsed during decoding. The key argument is either the integer list
 * index for a list property, the string map key for object properties, or null
 * for the final result.
 * @description Checks that this constructor creates a JsonCodec with the
 * reviver, which is called once for each object or list property that has been
 * parsed during decoding
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

check(JsonCodec codec, String toDecode, List expKeys, List expValues) {
  reviverKeys = [];
  reviverValues = [];
  var decoded = codec.decode(toDecode);
  Expect.equals("x", decoded);
  Expect.listEquals(expKeys, reviverKeys);
  Expect.listEquals(reviverValues, expValues);
}

main() {
  JsonCodec codec = new JsonCodec.withReviver(reviver);
  check(codec, '{"a": 3}', ["a", null], [3, {"a": "x"}]);
  check(codec, '{"b": 3.14}', ["b", null], [3.14, {"b": "x"}]);
  check(codec, '{"c": true}', ["c", null], [true, {"c": "x"}]);

  check(codec, '["d", "e"]', [0, 1, null], ["d", "e", ["x", "x"]]);
  check(codec, '{"f": {"g": "h"}}',
      ["g", "f", null], ["h", {"g": "x"}, {"f": "x"}]);
  check(codec, '["й", "ф"]', [0, 1, null], ["й", "ф", ["x", "x"]]);
  check(codec, '{"й": "ф"}', ["й", null], ["ф", {"й": "x"}]);
}
