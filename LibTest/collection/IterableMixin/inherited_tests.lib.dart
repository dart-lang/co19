/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion IterableMixin<E> abstract class
 * This [Iterable] mixin implements all [Iterable] members except [iterator].
 * @description Checks that all members of [Iterable] are implemented.
 * @author sgrekhov@unipro.ru
 */
library inherited_tests_iterablemixin;

import "../../core/Iterable/allTests.lib.dart" as iterator_tests;

test(Iterable create([Iterable content]), {bool isSet:false}) {
  iterator_tests.test(create, isSet:isSet);
}