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
 * @description Checks that provided compare function may not work on some
 * objects
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

int compare(String key1, String key2) {
  return int.parse(key1) - int.parse(key2);
}

main() {
  SplayTreeSet<String> set = new SplayTreeSet.from(["3", "2", "1", "4"], compare);
  Expect.equals(4, set.length);
  Expect.equals("1", set.elementAt(0));
  Expect.equals("2", set.elementAt(1));
  Expect.equals("3", set.elementAt(2));
  Expect.equals("4", set.elementAt(3));
  dynamic d = 2;
  Expect.throws(() {set.add(d);});
}
