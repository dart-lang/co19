/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract bool contains(E element)
 * Check whether the collection contains an element equal to element.
 * @description Checks that true is returned if the collection contains
 * an element equal to element, false otherwise.
 * @author kaigorodov
 */
library contains_A01_t01;

import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {
  List a=create();
  Expect.isFalse(a.contains(1));
  a.add(2);
  Expect.isFalse(a.contains(1));
  Expect.isTrue(a.contains(2));
  a.add(1);
  Expect.isTrue(a.contains(1));
  Expect.isTrue(a.contains(2));
}
