/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeSet([int compare(E key1, E key2),
 * bool isValidKey(potentialKey)])
 * ...
 * A provided compare function may not work on all objects. It may not even work
 * on all E instances.
 *
 * For operations that add elements to the set, the user is supposed to not pass
 * in objects that doesn't work with the compare function.
 *
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
  SplayTreeSet<String> set = new SplayTreeSet<String>(compare);
  set.add("3");
  set.add("2");
  set.add("1");
  set.add("4");

  Expect.equals(4, set.length);
  Expect.equals("1", set.elementAt(0));
  Expect.equals("2", set.elementAt(1));
  Expect.equals("3", set.elementAt(2));
  Expect.equals("4", set.elementAt(3));
}
