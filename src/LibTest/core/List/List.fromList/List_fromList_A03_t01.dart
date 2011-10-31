/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If [endIndex] is greather than the length, it has the same
 * effect as if it were [other.length]. 
 * @description Checks various out-of-bounds values for the [endIndex].
 * @author vasya
 * @reviewer msyabro
 * @reviewer varlax
 */
 
void arrayEquals(List expected, List actual, int startIndex) {
  Expect.equals(expected.length - startIndex, actual.length);
  for(var i = 0; i < actual.length; i++) {
    Expect.isTrue(actual[i] === expected[i+startIndex]);
    Expect.isTrue(actual[i] == expected[i+startIndex]);
  }
}

main() {
  List a = [null];
  List b = new List.fromList(a,0,100);
  arrayEquals(a, b, 0);

  a = [[]];
  b = new List.fromList(a,0,1000);
  arrayEquals(a, b, 0);

  a = new List(10001);
  a[10000] = "length";
  b = new List.fromList(a,1000,100000);
  arrayEquals(a, b, 1000);
}
