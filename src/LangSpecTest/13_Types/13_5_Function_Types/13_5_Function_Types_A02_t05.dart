/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion All functions implement the interface Function, so all function types are a subtype of Function.
 * @description Checks that functions are objects.
 * @author iefremov
 * @needsreview Formally speaking, this test cannot be deduced from the spec, since subtype relation is not transitive
 * and relation 'is more specific than' can not be applied to function types (there is no such relation as 'direct
 * supertype' for functions). However, keeping the test to make it legal (or rewrite it) one day.
 */

class C{
  f(){}
  static s(){}
}

g(){}

main() {
  c(){}
  Expect.isTrue(c is Object);
  Expect.isTrue(g is Object);
  Expect.isTrue(new C().f is Object);
  Expect.isTrue(C.s is Object);
}

