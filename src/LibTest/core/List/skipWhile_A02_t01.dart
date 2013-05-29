/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Iterable<E> skipWhile(bool test(E value))
 * The filtering happens lazily.
 * @description Checks that the test method is not called when the skipWhile is executed.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart"	;

bool test(E value) {
  Expect.fail("test($value) called");
}

main() {
  [].skipWhile(test);
  [1].skipWhile(test);
  [1,3,7,4,5,6].skipWhile(test);
}
