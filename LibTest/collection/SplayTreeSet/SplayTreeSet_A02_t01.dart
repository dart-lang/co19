/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeSet([int compare(E key1, E key2),
 * bool isValidKey(potentialKey)])
 * Create a new SplayTreeSet with the given compare function.
 * @description Checks that if the compare function is provided it is used for
 * elements comparison
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

int compare(key1, key2) {
  return 0;
}

main() {
  SplayTreeSet set = new SplayTreeSet(compare);
  set.add(1);
  set.add(2);
  set.add("3");
  set.add(null);

  Expect.equals(1, set.length);
  Expect.equals(1, set.elementAt(0));
}
