/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int length
 * Returns the number of elements in this.
 * @description Checks that the getter returns correct value.
 * @author kaigorodov
 */
library length_A01_t01;

import "../../../Utils/expect.dart";

test(Iterable create([Iterable content]), {bool isSet: false}) {

  void check(Iterable it, int expectedSet, int expectedList) {
    Expect.equals(isSet ? expectedSet: expectedList, it.length);
  }
  
  check(create([]), 0, 0);
  check(create(), 0, 0);
  check(create([null]), 1, 1);
  check(create([null, null]), 1, 2);
  check(create([0, 1, 2, 3]), 4, 4);

  Iterable b = const[const [null]];
  check(b, 1, 1);

  int many = 10000;
  check(create(new Iterable.generate(many, (index) => index)), many, many);
}
