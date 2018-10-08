/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool any(bool f(E element))
 * Returns true if one element of the collection satisfies the predicate [f].
 * Returns false otherwise.
 * @description Checks that this method works as specified.
 * @author pagolubev
 */
library allTests_A01_t01;

import "current_A01_t01.test.dart" as libCurrentNext;
import "Iterator_A01_t01.test.dart" as libIterator;
import "moveNext_A01_t01.test.dart" as libMoveNext;

test(Iterator create([Iterable content]), {bool isSet:false}) {
  libCurrentNext.test(create, isSet:isSet);  
  libIterator.test(create, isSet:isSet);  
  libMoveNext.test(create, isSet:isSet);  
}