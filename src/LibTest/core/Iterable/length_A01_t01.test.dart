/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int length
 * Returns the number of elements in this.
 * @description Checks that the getter returns correct value.
 * @author kaigorodov
 */
library length_A01_t01;

import "../../../Utils/expect.dart";

test(Iterable create([Iterable content]), {bool isSet:false}) {

  void check(Iterable content, int expected) {
    Iterable it = create(content);
    Expect.equals(expected, it.length);
  }
  
  check([], 0);
  check(new List(), 0);
  check(new List(0), 0);
  check(new List(100), 100);
  check([null], 1);
  check([null, null], 2);
  check(new List.from([0, 1, 2, 3]), 4);

  //List a = const [null];
  List b = const[const [null]];
  check(b, 1);

  int many=10000;
  check(new Iterable.generate(many, (index)=>index), many);
}
