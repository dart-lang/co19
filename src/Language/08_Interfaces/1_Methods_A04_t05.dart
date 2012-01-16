/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if an interface method m1 overrides an interface
 * member m2 and m1 does not declare all the named parameters declared by m2 in the same order. 
 * @description Checks that a situation where the overriding interface method has a different
 * set of named parameters, indeed results in a compile-time error.
 * @compile-error
 * @author rodionov
 * @reviewer kaigorodov
 * @needsreview issue 970
 */

interface I {
  void m1([var v1, var v2]);
}

interface J extends I {
  void m1([var v2, var v1]);
}

main() {
  J j = null;
  try {j.m1();} catch (var e) {}
}
