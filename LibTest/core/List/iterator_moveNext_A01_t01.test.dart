/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract bool moveNext()
 * Returns whether the [Iterator] has elements left.
 * @description Checks that true is returned only if the [Iterator] has elements
 * left.
 * @author kaigorodov
 */
library iterator_moveNext_A01_t01;

import "../../../Utils/expect.dart";

test(List create([int length])) {
  List a = create(25476);
  Iterator it = a.iterator;
  for (var i = 0; i < a.length; i++) {
    Expect.isTrue(it.moveNext());
  }
  Expect.isFalse(it.moveNext());
}
