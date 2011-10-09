/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Removes all elements of the array.
 * @description Checks that method clears all elements of the various arrays.
 * @author vasya
 * @reviewer iefremov
 * @needsreview it's not clear from the spec what is 'removing'.
 */


void arrayIsNull(Array a) {
  for(var i = 0; i < a.length; i++) {
    Expect.isTrue(a[i] == null);
  }
}

main() {
  Array a = [];
  a.clear();
  arrayIsNull(a);
  a.clear();
  arrayIsNull(a);

  a = [null];
  a.clear();
  arrayIsNull(a);

  a = [1,2,3];
  a.clear();
  arrayIsNull(a);

  a = ["one", "two", "three", "four"];
  a.clear();
  arrayIsNull(a);
  a.clear();
  arrayIsNull(a);

  a = new Array(96756);
  for(var i = 0; i < a.length; i++) {
    a[i] = i;
  }
  a.clear();
  arrayIsNull(a);

  a = [[],[null],[1,2,3,4],["one", "two", "three", "four"]];
  a.clear();
  arrayIsNull(a);
}
