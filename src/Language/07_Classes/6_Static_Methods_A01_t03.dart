/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Static methods are functions whose declarations are immediately
 * contained within a class declaration and that are declared static.
 * The static methods of a class C are those static methods declared by C.
 * @description Checks that it is a compile-time error when a superclass's
 * static method is being accessed using a subclass's name.
 * @author rodionov
 * @compile-error
 * @needsreview not explicitly documented in this chapter
 */

class S {
  static void foo() {}
}

class C extends S {
}

main() {
  try {
    C.foo();
  } catch(var e) {}
}
