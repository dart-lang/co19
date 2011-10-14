/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates a list which is a subcopy of [other], starting at
 * [startIndex] (inclusive) and ending at [endIndex] (exclusive).
 * If [startIndex] is negative, it has the same effect as if it were
 * zero. If [endIndex] is greather than the length, it has the same
 * effect as if it were [other.length]. If [startIndex > endIndex],
 * the created list is of [length] 0.
 * @description Checks that the created list is a subcopy of [other],
 * starting at [startIndex] (inclusive) and ending at [endIndex] (exclusive).
 * @author vasya
 * @reviewer msyabro
 */

void arrayEquals(List expected, List actual, int startIndex, int endIndex) {
  Expect.isTrue(expected is List);
  Expect.isTrue(expected.length == endIndex - startIndex);
  for(var i = 0; i < expected.length; i++) {
    Expect.isTrue(expected[i] === actual[i+startIndex]);
    Expect.isTrue(expected[i] == actual[i+startIndex]);
  }
}

main() {
  List a = ["0","1","2","3"];
  List b = new List.fromList(a,0,4);
  arrayEquals(b, a, 0, 4);

  a = [null,[null],[[]],"", 1,"String",[1,2,3]];
  b = new List.fromList(a,1,5);
  arrayEquals(b, a, 1, 5);

  a = [null];
  b = new List.fromList(a,0,1);
  arrayEquals(b, a, 0, 1);

  a = [];
  b = new List.fromList(a,0,0);
  arrayEquals(b, a, 0, 0);

  a = new List<int>(3069);
  for(var i = 0; i < a.length; i++) {
    a[i] = i;
  }
  b = new List.fromList(a,1000,2000);
  arrayEquals(b, a, 1000, 2000);
}
