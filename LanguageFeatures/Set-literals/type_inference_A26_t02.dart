/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Finally, we define inference on a setOrMapLiteral collection as
 * follows:
 * ...
 * Otherwise, collection is still ambiguous, the downwards context for the
 * elements of collection is ?, and the disambiguation is done using the
 * immediate elements of collection as follows:
 *
 * If all elements can be a set, and at least one element must be a set, then
 * collection is a set literal with static type Set<T> where T is the least
 * upper bound of the set element types of the elements.
 *
 * @description Checks that if all elements can be a set, and at least one
 * element must be a set, then collection is a set literal with static type
 * Set<T> where T is the least upper bound of the set element types of the
 * elements
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  dynamic d = [1, 2, 3];
  var s1 = {...d, 4};
  Expect.isTrue(s1 is Set<dynamic>);
  Expect.isFalse(s1 is Set<int>);

  var s2 = {...?d, 4};
  Expect.isTrue(s2 is Set<dynamic>);
  Expect.isFalse(s2 is Set<int>);
}
