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
 * @description Checks that if [endIndex] is greather than the length,
 * it has the same effect as if it were [other.length].
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
  List b = new List.fromList(a,0,100);
  arrayEquals(a, b, 0, a.length);

  a = [[]];
  b = new List.fromList(a,0,1000);
  arrayEquals(a, b, 0, a.length);

  a = new List(10001);
  a[10000] = "length";
  b = new List.fromList(a,1000,100000);
  arrayEquals(a, b, 1000, a.length);
}
