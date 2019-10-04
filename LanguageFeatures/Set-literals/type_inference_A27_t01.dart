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
 * ...
 * If all elements can be a map, and at least one element must be a map, then e
 * is a map literal with static type Map<K, V> where K is the least upper bound
 * of the key types of the elements and V is the least upper bound of the value
 * types.
 *
 * @description Checks that if all elements can be a map, and at least one
 * element must be a map, then e is a map literal with static type Map<K, V>
 * where K is the least upper bound of the key types of the elements and V is
 * the least upper bound of the value types.
 * @author sgrekhov@unipro.ru
 */
import "../../Utils/expect.dart";

main() {
  dynamic d1 = 1;
  dynamic d2 = 2;
  var m = {d1: d2, 3: 4};
  Expect.isTrue(m is Map<dynamic, dynamic>);
  Expect.isFalse(m is Map<int, int>);
}
