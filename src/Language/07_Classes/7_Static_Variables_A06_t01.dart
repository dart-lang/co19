/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A static variable declaration of the form static final T v = e; or the
 * form static final v = e; does not induce an implicit static setter.
 * @description Checks that there is no matching static setter induced for a static
 * final variable declaration by attempting to invoke one. Compile-time error expected.
 * @compile-error
 * @author rodionov
 * @needsreview Assertion not explicitly included in this chapter.
 */

class A {
  static final int a = 1;
}

main() {
  try {
    A.a = 1;
  } catch(var e) {}
}
