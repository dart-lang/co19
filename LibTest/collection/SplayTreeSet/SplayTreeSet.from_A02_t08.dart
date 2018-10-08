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
 * @description Checks that if the isValidKey function returns false for an
 * object, it is assumed to not be in the set
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

bool isValidKey(potentialKey) {
  return potentialKey is String;
}

int compare(var key1, var key2) {
  return 1;
}

main() {
  SplayTreeSet set = new SplayTreeSet.from([3], compare, isValidKey);

  Expect.equals(1, set.length);
  Expect.isFalse(set.contains(3));
  Expect.isNull(set.lookup(3));
  Expect.isFalse(set.remove(3));
  set.removeAll([1, 3]);
  Expect.equals(1, set.length);

  set.retainAll([1, 2, 3]);
  Expect.equals(0, set.length);
}
