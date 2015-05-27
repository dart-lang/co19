/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String mapToString(Map m)
 * Returns a string representing the specified map. The returned string looks
 * like this: '{key0: value0, key1: value1, ... keyN: valueN}'. The value
 * returned by its toString method is used to represent each key or value.
 *
 * If the map collection contains a reference to itself, either directly as
 * a key or value, or indirectly through other collections or maps, the
 * contained reference is rendered as '{...}'. This prevents the infinite
 * regress that would otherwise occur.
 * @description Checks that each key and each value toString() representation
 * is contained in the mapToString() result and each key.toString() is
 * followed by a colon.
 * @author ilya
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  Map map = new Map();

  map["foo"] = "bar";
  map[1] = 2;
  map[#qwe] = #asd;
  map[null] = dynamic;
  map[(){}] = (x) => ++x;

  var s = Maps.mapToString(map);

  Maps.forEach(map, (k, v) {
    Expect.isTrue(s.contains('${k.toString()}:'));
    Expect.isTrue(s.contains(v.toString()));
  });
}
