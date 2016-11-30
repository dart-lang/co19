/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description All BidirectionalIterator tests runner
 * @author sgrekhov@unipro.ru
 */
library bidirectional_iterator_all_tests;

import "inheritedTests.lib.dart" as lib_inherited_tests;
import "movePrevious_A01_t01.test.dart" as libMovePrevious;

test(BidirectionalIterator create([Iterable content]), {bool isSet:false}) {
  lib_inherited_tests.test(create, isSet:isSet);
  libMovePrevious.test(create);
}