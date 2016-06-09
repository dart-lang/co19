/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion class SplayTreeSet<E>
 * A Set of objects that can be ordered relative to each other.
 * Mixes-in IterableMixin<E> SetMixin<E>
 * @description Checks that all inherited methods are implemented.
 * @author sgrekhov@unipro.ru
 */
import "dart:collection";
import "inherited_tests.lib.dart" as inherited_tests;

int compare(var key1, var key2) {
  if (key1 is Comparable && key2 is Comparable) {
    return key1.compareTo(key2);
  } else {
    if (key1 != null && key2 == null) {
      return 1;
    }
    if (key1 == null && key2 != null) {
      return -1;
    }
    return 0;
  }
}

SplayTreeSet create([Iterable content]) {
  if (content == null) {
    return new SplayTreeSet(compare);
  } else {
    return new SplayTreeSet.from(content, compare);
  }
}

main() {
  inherited_tests.test(create);
}
