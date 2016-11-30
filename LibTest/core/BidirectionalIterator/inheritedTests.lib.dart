/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract class BidirectionalIterator<E>
 * An Iterator that allows moving backwards as well as forwards.
 * Implements Iterator<E>
 * Implemented by RuneIterator
 * @description Checks that all members of [Iterator] are implemented.
 * @author sgrekhov@unipro.ru
 */
library inherited_tests_bidirectional_iterator;

import "../Iterator/allTests.lib.dart" as iterator_tests;

test(BidirectionalIterator create([Iterable content]), {bool isSet: false}) {
  iterator_tests.test(create, isSet: isSet);
}