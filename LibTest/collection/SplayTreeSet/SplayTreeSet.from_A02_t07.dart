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
 * @description Checks that if isValidKey function is provided then it called
 * before contains, remove, lookup, removeAll or retainAll
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

bool startTesting = false;
bool isValidkeyCalled = false;
bool compareCalled = false;

bool isValidKey(potentialKey) {
  if (startTesting) {
    isValidkeyCalled = true;
  }
  return potentialKey is String;
}

int compare(String key1, String key2) {
  if (startTesting) {
    Expect.isTrue(isValidkeyCalled);
  }
  return 1;
}

main() {
  SplayTreeSet<String> set = new SplayTreeSet<String>.from(["", "1", "2", "3"], compare,
      isValidKey);

  startTesting = true;
  set.contains(3);
  isValidkeyCalled = false;
  set.lookup(3);
  isValidkeyCalled = false;
  set.remove(3);
  isValidkeyCalled = false;
  set.removeAll([1, 3]);
  isValidkeyCalled = false;
  set.retainAll([1, 2, 3]);

  Expect.isTrue(isValidkeyCalled);
  Expect.isFalse(compareCalled);
}
