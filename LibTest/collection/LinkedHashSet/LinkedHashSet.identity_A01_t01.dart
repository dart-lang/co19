/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashSet.identity()
 * Creates an insertion-ordered identity-based set.
 * Effectively a shorthand for:
 * [new LinkedHashSet(equals: identical, hashCode: identityHashCode)]
 * @description Checks that created hash set is equivalent of
 * [new HashSet<E>(equals: identical, hashCode: identityHashCode)]
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

class C {
  int get hashCode => 1;
  bool operator ==(Object c) {
    return true;
  }
}

main() {
  LinkedHashSet<C> set1 = new LinkedHashSet<C>.identity();
  LinkedHashSet<C> set2 = new LinkedHashSet<C>(equals: identical,
      hashCode: identityHashCode);
  LinkedHashSet<C> set3 = new LinkedHashSet<C>();

  C val1 = new C();
  C val2 = new C();
  C val3 = new C();

  set1.add(val1);
  set1.add(val2);
  set1.add(val3);

  set2.add(val1);
  set2.add(val2);
  set2.add(val3);

  set3.add(val1);
  set3.add(val2);
  set3.add(val3);

  Expect.equals(3, set1.length);
  Expect.equals(3, set2.length);
  Expect.equals(1, set3.length);
}
