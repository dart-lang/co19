/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeSet([int compare(E key1, E key2),
 * bool isValidKey(potentialKey)])
 * ...
 * The methods contains, remove, lookup, removeAll or retainAll are typed to
 * accept any object(s), and the isValidKey test can used to filter those
 * objects before handing them to the compare function.
 * If isValidKey is provided, only values satisfying isValidKey(other) are
 * compared using the compare method in the methods mentioned above
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

int compare(var key1, var key2) {
  if (startTesting) {
    Expect.isTrue(isValidkeyCalled);
  }
  return 1;
}

main() {
  SplayTreeSet set = new SplayTreeSet(compare, isValidKey);
  set.add("");
  set.add("1");
  set.add("2");
  set.add("3");

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
