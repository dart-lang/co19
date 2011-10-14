/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a new list with the elements of this list that satisfy the predicate [f].
 * @description Checks that if non-closure object is passed as [f], no exception is thrown
 * @author msyabro
 * @needsreview undocumented behavior
 */

typedef bool f(var e);

class A {
  A() {}
}
 
main() {
  int x;
  
  [].filter(null);
  [].filter(x);
  [].filter(false);
  [].filter(1);
  [].filter("");
  [].filter(new Promise<f>());
  [].filter([1, 2, 3]);
  [].filter(new A());
}