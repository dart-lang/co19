/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeSet([int compare(E key1, E key2),
 * bool isValidKey(potentialKey)])
 * ...
 * If omitted, the isValidKey function defaults to checking against the type
 * parameter: other is E.
 * @description Checks that isValidKey function defaults to checking against the
 * type parameter: other is E and prevents calling of compare
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

bool startTesting = false;
bool compareCalled = false;

int compare(String key1, String key2) {
  if (startTesting) {
    compareCalled = true;
  }
  return 0;
}

main() {
  SplayTreeSet<String> set = new SplayTreeSet<String>(compare);
  set.add("");
  set.add("1");
  set.add("2");
  set.add("3");

  startTesting = true;
  set.contains(3);
  set.lookup(3);
  set.remove(3);
  set.removeAll([1, 3]);
  set.retainAll([1, 2, 3]);

  Expect.isFalse(compareCalled);
}
