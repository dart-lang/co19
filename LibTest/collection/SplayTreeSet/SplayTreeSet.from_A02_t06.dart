/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeSet.from(Iterable elements, [int compare(E key1, E key2),
 * bool isValidKey(potentialKey)])
 * ...
 * The set works as if created by new SplayTreeSet<E>(compare, isValidKey).
 * @description Checks that the value that is not supported by compare functions
 * may be passed in
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

int compare(String key1, String key2) {
  return int.parse(key1) - int.parse(key2);
}

main() {
  Expect.throws(() { new SplayTreeSet<String>.from(["", "No way"], compare);});
}
