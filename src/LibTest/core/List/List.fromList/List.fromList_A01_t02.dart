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
 * @description Checks that if [startIndex] is negative, it has the same effect as if it were zero.
 * @author vasya
 * @reviewer msyabro
 */
 
void arrayEquals(List expected, List actual, int startIndex, int endIndex) {
  Expect.isTrue(actual is List);
  Expect.equals(endIndex - startIndex, actual.length);
  for(var i = 0; i < actual.length; i++) {
    Expect.isTrue(actual[i] === expected[i+startIndex]);
    Expect.isTrue(actual[i] == expected[i+startIndex]);
  }
}

main() {
  List a = [null];
  List b = new List.fromList(a,-100,1);
  arrayEquals(a, b, 0, 1);

  a = [[]];
  b = new List.fromList(a,-1,1);
  arrayEquals(a, b, 0, 1);

  a = new List(10157);
  a[0] = "zero";
  b = new List.fromList(a,-1000000000,10000);
  arrayEquals(a, b, 0, 10000);
}
