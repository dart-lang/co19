/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion HashMap({bool equals(K key1, K key2), int hashCode(K key),
 * bool isValidKey(potentialKey) })
 * Creates an unordered hash-table based Map.
 * @description Checks that an empty hash map is created
 * @author msyabro
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  HashMap map = new HashMap();
  Expect.isTrue(map is HashMap);
  Expect.isTrue(map.isEmpty);
}
