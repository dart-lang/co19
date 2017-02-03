/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String mapToString(Map m)
 * If the map collection contains a reference to itself, either directly as
 * a key or value, or indirectly through other collections or maps, the
 * contained reference is rendered as '{...}'. This prevents the infinite
 * regress that would otherwise occur.
 * @description Checks that if all references to itself in a map collection
 * are rendered as '{...}'.
 * @author ilya
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  Map map = new Map();

  map[map] = 1; // 1
  map[1] = map; // 2
  map[3] = 4;
  map[[map, map]] = [map, map]; // 6
  map[{map:map}] = {map:map}; // 10

  Expect.equals(10, '{...}'.allMatches(Maps.mapToString(map)).length);
}
