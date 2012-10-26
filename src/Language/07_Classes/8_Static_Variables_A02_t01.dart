/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A static variable declaration of one of the forms static var  v;,
 * static var  v = e; static  const v = e;  or static final v = e; always induces
 * an implicit static getter function with signature static get v().
 * @description Checks that the returned type of this implicit getter is the same as the
 * static field's type (dynamic), by making sure there're no static warnings when invoking
 * non-existing methods on the value returned by these getters.
 * @author rodionov
 * @reviewer msyabro
 * @note This test only makes sense in the presence of static checker.
 */

class A {
  static var a;
  static var b = null;
  static final c = null;
  static const d = null;
}

main() {
  try {
    A.a.nonexistent();
  } on NullPointerException catch (e) {}
  
  try {
    A.b.nonexistent();
  } on NullPointerException catch (e) {}
  
  try {
    A.c.nonexistent();
  } on NullPointerException catch (e) {}

  try {
    A.d.nonexistent();
  } on NullPointerException catch (e) {}
}
