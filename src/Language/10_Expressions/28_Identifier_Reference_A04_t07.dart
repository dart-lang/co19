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
 * instance scope, referencing a built-in identifier results in NoSuchMethodException as long
 * as the identifier is placed in such a way that it cannot be mistaken for another token.
 * @static-warning
 * @author rodionov
 * @reviewer iefremov
 */

class A {
  test() {
    try {abstract();} catch (NoSuchMethodException ok) {}
    try {++assert;} catch (NoSuchMethodException ok) {}
    try {1 + call;} catch (NoSuchMethodException ok) {}
    // skipping Dynamic as it's also a type name and thus causes a compile-time error
    try {1 << equals;} catch (NoSuchMethodException ok) {}
    try {1 * factory;} catch (NoSuchMethodException ok) {}
    try {1 >= get;} catch (NoSuchMethodException ok) {}
    try {var x = implements;} catch (NoSuchMethodException ok) {}
    try {1 == interface;} catch (NoSuchMethodException ok) {}
    try {negate[0];} catch (NoSuchMethodException ok) {}
    try {operator.x;} catch (NoSuchMethodException ok) {}
    try {--set;} catch (NoSuchMethodException ok) {}
    try {true & static;} catch (NoSuchMethodException ok) {}
    try {++typedef;} catch (NoSuchMethodException ok) {}
  }
}

main() {
  new A().test();
}
