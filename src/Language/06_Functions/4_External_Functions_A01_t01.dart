/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An external function is a function that can be used within a Dart program, 
 * but that is defined outside of that Dart program. An external function may be a 
 * top-level function, a method, a getter, a setter or a non-redirecting constructor.
 * External functions are introduced via the built-in identifier external followed by 
 * the function signature.
 * An external function is connected to its body by an implementation specific mechanism.
 * Attempting to invoke an external function that has not been connected to its body 
 * will raise a NoSuchMethodError or some subclass thereof.
 * @description Checks that invoking an external function that is not connected to
 * its body indeed results in a NoSuchMethodError or its subclass being thrown.
 * @author rodionov
 * @reviewer kaigorodov
 * @issue 5774
 */

external f();
external g([var x]);
external h({var x});

main() {
var s="";
  try {
    f();
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(e) {
  } catch(e) {print("unexpected exception of type ${e.runtimeType}: $e");}

  try {
    g();
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(e) {}

  try {
    h();
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(e) {}
}
