/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E first
 * Returns the first element.
 * Throws a StateError if this is empty. Otherwise returs the first element
 * in the iteration order, equivalent to (iterator..moveNext())..current.
 * @description Checks that the method returns the first element.
 * @author kaigorodov
 */
library first_A01_t01;
 
import "../../../Utils/expect.dart";

check(Iterable create([Iterable content]), Iterable source) {
  Expect.equals(source.first, create(source).first);
}

test(Iterable create([Iterable content])) {
  check(create, [0]);
  check(create, [1]);
  check(create, [1, 2, 3]);
}

