/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A static variable declaration of one of the forms static var v;,
 * static var v = e; or static final v = e; always induces an implicit static
 * getter function with signature static get v() whose invocation evaluates to
 * the value stored in v.
 * @description Checks that the returned type of this implicit getter is the same as the
 * static field's type (Dynamic), by making sure there're no static warnings when invoking
 * non-existing methods on the value returned by these getters.
 * @author rodionov
 * @note This test only makes sense in the presence of static checker.
 */

class A {
  static var a;
  static var b = null;
  static final c = null; 
}

main() {
  try {
    A.a.nonexistent();
  } catch (NullPointerException e) {}
  
  try {
    A.b.nonexistent();
  } catch (NullPointerException e) {}
  
  try {
    A.c.nonexistent();
  } catch (NullPointerException e) {}
}
