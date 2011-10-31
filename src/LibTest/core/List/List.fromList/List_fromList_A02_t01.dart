/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If [startIndex] is negative, it has the same effect as if it were
 * zero. 
 * @description Checks various negative values for the [startIndex].
 * @author vasya
 * @reviewer msyabro
 * @reviewer varlax
 */
 
void arrayEquals(List expected, List actual, int endIndex) {
  int startIndex = 0;
  Expect.equals(endIndex - startIndex, actual.length);
  for(var i = 0; i < actual.length; i++) {
    Expect.isTrue(actual[i] === expected[i+startIndex]);
    Expect.isTrue(actual[i] == expected[i+startIndex]);
  }
}

main() {
  List a = [null];
  List b = new List.fromList(a,-100,1);
  arrayEquals(a, b, 1);

  a = [[]];
  b = new List.fromList(a,-1,1);
  arrayEquals(a, b, 1);

  a = new List(10157);
  a[0] = "zero";
  b = new List.fromList(a,-1000000000,10000);
  arrayEquals(a, b, 10000);
}
