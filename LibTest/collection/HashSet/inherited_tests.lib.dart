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
library inherited_tests_hashset;

import "../../core/Set/all_tests.lib.dart" as set_tests;

test(Set create([Iterable content])) {
  set_tests.test(create);
}