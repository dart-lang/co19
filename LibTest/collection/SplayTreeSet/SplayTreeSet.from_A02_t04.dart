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
 * @description Checks that if the compare function is omitted, it defaults to
 * Comparable.compare
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

class C implements Comparable {
  int value;
  C(this.value);

  compareTo(dynamic other) {
    return this.value - other.value;
  }
}

main() {
  C c1 = new C(2);
  C c2 = new C(1);
  C c3 = new C(-1);
  C c4 = new C(1);

  SplayTreeSet set = new SplayTreeSet.from([c1, c2, c3, c4]);
  Expect.equals(3, set.length);
  Expect.equals(c3, set.elementAt(0));
  Expect.equals(c2, set.elementAt(1));
  Expect.equals(c1, set.elementAt(2));
}
