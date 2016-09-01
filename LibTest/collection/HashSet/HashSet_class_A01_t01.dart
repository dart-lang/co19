/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion HashSet<E> class 
 * Implements Set<E>
 * @description Checks that all members of [Set] are implemented.
 * @author kaigorodov
 */
import "dart:collection";
import "inherited_tests.lib.dart" as libSet;

Set create([Iterable content]) {
  if (content == null) {
    return new HashSet();
  } else {
    return new HashSet.from(content);
  }
}

main() {
  libSet.test(create);
}
