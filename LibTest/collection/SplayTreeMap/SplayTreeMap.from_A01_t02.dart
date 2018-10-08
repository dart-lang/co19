/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeMap.from(Map other, [int compare(K key1, K key2),
 * bool isValidKey(potentialKey)])
 * Creates a [SplayTreeMap] that contains all key/value pairs of [other].
 * @description Checks that it is an error if [other] is [null]
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() { new SplayTreeMap.from(null); });
}
