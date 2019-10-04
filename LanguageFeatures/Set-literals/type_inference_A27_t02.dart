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
  dynamic d = {1:1, 2:2, 3:3};
  var m1 = {...d, 4: 4};
  Expect.isTrue(m1 is Map<Object, Object>);
  Expect.isFalse(m1 is Map<int, int>);

  var m2 = {...?d, 4:4};
  Expect.isTrue(m2 is Map<Object, Object>);
  Expect.isFalse(m2 is Map<int, int>);

  var m3 = {...{}, 4:4};
  Expect.isTrue(m3 is Map<Object, Object>);
  Expect.isFalse(m3 is Map<int, int>);

  var m4 = {...?{}, 4:4};
  Expect.isTrue(m4 is Map<Object, Object>);
  Expect.isFalse(m4 is Map<int, int>);
}
