/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an identifier expression e of the form id proceeds as follows:
 * Let d be the innermost declaration in the enclosing lexical scope whose name
 * is id. It is a compile-time error if d is a class, interface or type variable. If no such
 * declaration exists in the lexical scope, let d be the declaration of the inherited
 * member named id if it exists.
 * @description  Checks that it is not a compile-time error by itself when a built-in identifier
 * is used in an identifier reference, but since no declaration with that name can exist, lookup
 * fails eventually with the type of error depending on context. This test checks that in a class
 * instance scope, referencing a built-in identifier results in NoSuchMethodError as long
 * as the identifier is placed in such a way that it cannot be mistaken for another token.
 * @static-warning
 * @author rodionov
 * @reviewer iefremov
 */
import "../../Utils/expect.dart";

class A {
  test() {
    try {
      abstract(); /// static type warnings galore - unresolved identifiers and members
      Expect.fail("NoSuchMethodError expected.");
    } on NoSuchMethodError catch(ok) {}

    try {
      1 + as;
      Expect.fail("NoSuchMethodError expected.");
    } on NoSuchMethodError catch(ok) {}

    // skipping Dynamic as it's also a type name and thus causes a compile-time error

    try {
      1 << export;
      Expect.fail("NoSuchMethodError expected.");
    } on NoSuchMethodError catch(ok) {}
    
    try {
      external ^ 0;
      Expect.fail("NoSuchMethodError expected.");
    } on NoSuchMethodError catch(ok) {}
    
    try {
      1 * factory;
      Expect.fail("NoSuchMethodError expected.");
    } on NoSuchMethodError catch(ok) {}
    
    try {
      1 >= get;
      Expect.fail("NoSuchMethodError expected.");
    } on NoSuchMethodError catch(ok) {}
    
    try {
      var x = implements;
      Expect.fail("NoSuchMethodError expected.");
    } on NoSuchMethodError catch(ok) {}
    
    try {
      1 == import;
      Expect.fail("NoSuchMethodError expected.");
    } on NoSuchMethodError catch(ok) {}
    
    try {
      1 == library;
      Expect.fail("NoSuchMethodError expected.");
    } on NoSuchMethodError catch(ok) {}
    
    try {
      operator.x;
      Expect.fail("NoSuchMethodError expected.");
    } on NoSuchMethodError catch(ok) {}
    
    try {
      1 == part;
      Expect.fail("NoSuchMethodError expected.");
    } on NoSuchMethodError catch(ok) {}
    
    try {
      --set;
      Expect.fail("NoSuchMethodError expected.");
    } on NoSuchMethodError catch(ok) {}
    
    try {
      true & static;
      Expect.fail("NoSuchMethodError expected.");
    } on NoSuchMethodError catch(ok) {}
    
    try {
      ++typedef;
      Expect.fail("NoSuchMethodError expected.");
    } on NoSuchMethodError catch(ok) {}
  }
}

main() {
  new A().test();
}
