/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable declaration of one of the forms
 * var v;, var v = e; , const v = e;, final v; or final v = e;
 * always induces an implicit getter function with signature
 *   get v
 * @description Checks that the returned type of this implicit getter is the 
 * same as the static field's type (dynamic), by making sure there're no 
 * static warnings when invoking non-existing methods on the value returned by 
 * these getters.
 * @static-clean
 * @author rodionov
 * @reviewer msyabro
 */
import "../../Utils/expect.dart";

class A {
  static var a;
  static var b = null;
  static final c = null;
  static const d = null;
}

main() {
  try {
    A.a.nonexistent();
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch (e) {}
  
  try {
    A.b.nonexistent();
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch (e) {}
  
  try {
    A.c.nonexistent();
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch (e) {}

  try {
    A.d.nonexistent();
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch (e) {}
}
