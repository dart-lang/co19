/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion interface HashSet.from(Iterable elements)
 * All the [elements] should be assignable to [E]. [The elements] iterable
 * itself may have any element type, so this constructor can be used to
 * down-cast a [Set], for example as:
 * Set<SuperType> superSet = ...;
 * Set<SubType> subSet =
 *     new HashSet<SubType>.from(superSet.where((e) => e is SubType));
 * @description Checks that HashSet.from throws TypeError if [elements]
 * contains element of incompatible type
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  Expect.throws(() {
    new HashSet<int>.from(["testme", 1, 2, 3, null, "", [], [1, 2, 3], {},
      new Error(), -1, -2, "string1", "string2", "string3", 'a', 'b', 'c']);
  }, (e) => e is TypeError || e is CastError
  );
}
