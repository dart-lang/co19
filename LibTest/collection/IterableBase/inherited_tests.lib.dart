/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion IterableBase<E> abstract class 
 * Implements Iterable<E>
 * @description Checks that all members of [Iterable] are implemented.
 * @author kaigorodov
 */
library inherited_tests_iterablebase;

import "../../core/Iterable/allTests.lib.dart" as iterator_tests;

test(Iterable create([Iterable content]), {bool isSet:false}) {
  iterator_tests.test(create, isSet:isSet);
}