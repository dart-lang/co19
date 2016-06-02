/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion SplayTreeSet([int compare(E key1, E key2),
 * bool isValidKey(potentialKey)])
 * ...
 * If the compare function is omitted, it defaults to Comparable.compare, and
 * the elements must be comparable.
 * @description Checks that if the compare function is omitted, and the elements
 * are not comparable then exception is thrown
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

class C {}

main() {
  SplayTreeSet set = new SplayTreeSet();
  set.add(new C());
  Expect.throws(() {set.add(new C());});
}
