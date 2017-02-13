/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeMap([int compare(K key1, K key2),
 * bool isValidKey(potentialKey)])
 * A [Map] of objects that can be ordered relative to each other.
 * @description Checks that map created is a [Map] of objects that can be
 * ordered relative to each other.
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  SplayTreeMap map = new SplayTreeMap();
  map[2] = 2;
  map[4] = 4;
  map[1] = 1;
  map[3] = 3;

  Expect.equals(1, map.keys.elementAt(0));
  Expect.equals(2, map.keys.elementAt(1));
  Expect.equals(3, map.keys.elementAt(2));
  Expect.equals(4, map.keys.elementAt(3));
}
