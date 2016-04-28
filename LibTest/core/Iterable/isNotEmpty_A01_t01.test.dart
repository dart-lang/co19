/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isNotEmpty
 * Returns true if there is at least one element in this collection.
 * May be computed by checking if iterator.moveNext() returns true.
 * @description Checks various collections, that the method returns false if
 * there are no elements, in the collection, true otherwise.
 * @author kaigorodov
 */
library isNotEmpty_A01_t01;
 
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {
  Expect.isFalse(create([]).isNotEmpty);
  Expect.isTrue(create([null]).isNotEmpty);
  Expect.isTrue(create(const[0, 1, 2, 3, 4]).isNotEmpty);
  Expect.isTrue(create([0]).isNotEmpty);
}
