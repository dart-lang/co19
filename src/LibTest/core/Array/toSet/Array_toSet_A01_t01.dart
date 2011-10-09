/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns this collection as a set.
 * @description Check that array is converted to a set and the set contains all elements of the array.
 * @author vasya
 * @reviewer iefremov
 */


void arrayContains(Set s, Array a) {
  Expect.isTrue(s is Set);
  Expect.isTrue(s.containsAll(a));
  Expect.isTrue(s.isSubsetOf(a));
}

main() {
  Array a = [];
  Set s = a.toSet();
  arrayContains(s, a);
  Expect.isTrue(s.isEmpty());

  a = ["1","2","3","4","5"];
  s = a.toSet();
  arrayContains(s, a);

  a = new Array(5689);
  for (var i=0; i < a.length; i++){
    a[i] = i;
  }
  s = a.toSet();
  arrayContains(s, a);
}
