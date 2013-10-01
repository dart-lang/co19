/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set<E> abstract class 
 * Implements Iterable<E>
 * @description Checks that all members of [Iterable] are implemented.
 * @author kaigorodov
 */
library allTests_A01_t01;

import "../../core/Iterable/allTests.lib.dart" as libIterator;

test(Iterable create([Iterable content])) {
  libIterator.test(create, isSet:true);  
}