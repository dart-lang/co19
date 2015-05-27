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
//library length_A01_t01;

import "dart:collection";
import "../../../Utils/expect.dart";

test(Iterable create([Iterable content]), {bool isSet:false}) {

  void check(Iterable content, int expectedSet, int expectedList) {
    Iterable it = create(content);
    Expect.equals(isSet?expectedSet:expectedList, it.length);
  }
  
  check([], 0,0);
  check(new List(), 0,0);
  check(new List(0), 0,0);
  check(new List(100), 1,100);
  check([null], 1,1);
  check([null, null], 1,2);
  check(new List.from([0, 1, 2, 3]), 4,4);

  List b = const[const [null]];
  check(b, 1,1);

  int many=10000;
  check(new Iterable.generate(many, (index)=>index), many, many);
}