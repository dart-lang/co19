/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion K firstKeyAfter(K key)
 * Returns [null] if no [key] was not found.
 * @description Checks that [null] is returned if no [key] was found
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  SplayTreeMap map = new SplayTreeMap();
  Expect.isNull(map.firstKeyAfter(1));

  map[0] = null;
  Expect.isNull(map.firstKeyAfter(1));
}
