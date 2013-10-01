/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  final bool isEmpty
 * Returns true if there is no element in this collection.
 * @description Checks various containers, that the method returns true if there is no elements,
 * in the containers, false otherwise.
 * @author kaigorodov
 */
library isEmpty_A01_t01;
 
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {
  Expect.isTrue(create([]).isEmpty);
  Expect.isFalse(create([null]).isEmpty);
  Expect.isFalse(create(const[0,1,2,3,4]).isEmpty);
  Expect.isFalse(create([[]]).isEmpty);
}
