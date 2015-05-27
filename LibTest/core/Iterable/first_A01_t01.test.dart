/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final E first
 * @assertion Returns the first element.
 * @description Checks that the method returns the first element.
 * @author kaigorodov
 */
library first_A01_t01;
 
import "../../../Utils/expect.dart";

check(Iterable create([Iterable content]), Iterable source) {
  Expect.equals(source.first, create(source).first);
}

test(Iterable create([Iterable content])) {
  check(create, [null]);
  check(create, [1]);
  check(create, [1,2,3]);
  check(create, [[null]]);
}
