/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns this collection as an array. 
 * @description Check that the new collection is the same array.
 * @author vasya
 * @reviewer iefremov
 */


void arrayEquals(Array expected, Array actual) {
  Expect.isTrue(expected is Array);
  Expect.isTrue(expected.length == actual.length);
  for(var i = 0; i < expected.length; i++) {
    Expect.isTrue(expected[i] === actual[i]);
    Expect.isTrue(expected[i] == actual[i]);
  }
}

main() {
  Array a = ["0","1","2","3"];
  Array b = a.toArray();
  arrayEquals(a, b);

  a = [null,[null],[[]],"", 1,"String",[1,2,3]];
  b = a.toArray();
  arrayEquals(a, b);

  a = [null];
  b = a.toArray();
  arrayEquals(a, b);

  a = [];
  b = a.toArray();
  arrayEquals(a, b);

  a = new Array<int>(3069);
  for(var i = 0; i < a.length; i++) {
    a[i] = i;
  }
  b = a.toArray();
  arrayEquals(a, b);
}
