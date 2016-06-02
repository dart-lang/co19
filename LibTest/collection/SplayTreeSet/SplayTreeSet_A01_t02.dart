/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeSet([int compare(E key1, E key2),
 * bool isValidKey(potentialKey)])
 * A Set of objects that can be ordered relative to each other.
 * @description Checks that objects in SplayTreeSet are ordered relative to each
 * other
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  SplayTreeSet set = new SplayTreeSet();
  set.add(3);
  set.add(4);
  set.add(1);
  set.add(2);

  Expect.equals(1, set.elementAt(0));
  Expect.equals(2, set.elementAt(1));
  Expect.equals(3, set.elementAt(2));
  Expect.equals(4, set.elementAt(3));
}
