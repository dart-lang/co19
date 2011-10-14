/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Applies the function [f] for each element of the list.
 * @description Checks that if argument [f] is not a function,
 *  no exception is thrown.
 * @author msyabro
 * @needsreview undocumented behavior
 */

typedef bool f(var e);

class A {
  A() {}
}
 
main() {
  int x;
  
  [].forEach(null);
  [].forEach(x);
  [].forEach(false);
  [].forEach(1);
  [].forEach("");
  [].forEach(new Promise<f>());
  [].forEach([1, 2, 3]);
  [].forEach(new A());
}