/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion K lastKeyBefore(K key)
 * Get the last key in the map that is strictly smaller than [key].
 * @description Checks that the last key that is strictly smaller than [key] is
 * returned
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  SplayTreeMap map = new SplayTreeMap.from({1: 0, 2: "2", 3: null});
  Expect.equals(3, map.lastKeyBefore(100));
  Expect.equals(2, map.lastKeyBefore(3));

  map.remove(2);
  Expect.equals(1, map.lastKeyBefore(2));

  map = new SplayTreeMap.from({3: 0, 2: "2", 1: null});
  Expect.equals(1, map.lastKeyBefore(2));
  Expect.equals(2, map.lastKeyBefore(3));

  map.remove(2);
  Expect.equals(1, map.lastKeyBefore(2));
}
