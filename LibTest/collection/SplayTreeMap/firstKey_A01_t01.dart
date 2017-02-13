/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion K firstKey()
 * Get the first key in the map.
 * @description Checks that the first key in a map is returned
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  SplayTreeMap map = new SplayTreeMap.from({1: 0, 2: "2", 3: null});
  Expect.equals(1, map.firstKey());

  map.remove(1);
  Expect.equals(2, map.firstKey());

  map = new SplayTreeMap.from({3: 0, 2: "2", 1: null});
  Expect.equals(1, map.firstKey());

  map.remove(1);
  Expect.equals(2, map.firstKey());

  map.remove(2);
  Expect.equals(3, map.firstKey());
}
