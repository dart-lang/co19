/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if every element of the list satisfy the predicate [f].
 * Returns false otherwise.
 * @description Tries to change the list from [f]
 * @author msyabro
 * @needsreview
 */

main() {
  List a = new List();
  a.addAll([0,1,2,3,4,5,6,7,8,9]);
  int count = 0;
  a.every(bool func(var e) {
    a = new List();
    count++;
    return true;
  });
  Expect.equals(10, count);
  Expect.isTrue(a.isEmpty());
}
