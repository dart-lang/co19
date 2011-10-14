/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if some elements of the list satisfy the predicate [f].
 * @description Checks that if parameter [f] is not a function,
 * no exception is thrown.
 * @author msyabro
 * @needsreview undocumented behavior
 */

typedef bool f(var e);

class A {
  A() {}
}
 
main() {
  int x;
  
  [].some(null);
  [].some(x);
  [].some(false);
  [].some(1);
  [].some("");
  [].some(new Promise<f>());
  [].some([1, 2, 3]);
  [].some(new A());
}