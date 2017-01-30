/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashSet<E> class implements Set<E>
 * The set allows [null] as a element.
 * @description Checks that it's possible to have [null] as a set element.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  LinkedHashSet set = new LinkedHashSet();

  Expect.isFalse(set.contains(null));

  set.add(null);
  Expect.isTrue(set.contains(null));

  for (int i = 0; i < 100; i++) {
    set.add(i);
    Expect.isTrue(set.contains(null));
  }

  set.add(null);
  Expect.isTrue(set.contains(null));

  set.remove(null);
  Expect.isFalse(set.contains(null));
}
