/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a built-in identifier is used as
 * the declared name of a prefix, class, type parameter or type alias.
 * @description  Checks that when a built-in identifier is used in an identifier
 * reference, but since no declaration with that name can exist, lookup fails
 * eventually with the type of error depending on context. This test checks that
 * in a class instance scope, referencing a built-in identifier results in
 * a compile error
 * @author rodionov
 */

class A {
  test() {
    abstract();          //# 01: compile-time error
    1 + as;              //# 02: compile-time error
    1 << export;         //# 03: compile-time error
    external ^ 0;        //# 04: compile-time error
    1 * factory;         //# 05: compile-time error
    1 >= get;            //# 06: compile-time error
    var x = implements;  //# 07: compile-time error
    1 == import;         //# 08: compile-time error
    1 == library;        //# 09: compile-time error
    operator.x;          //# 10: compile-time error
    1 == part;           //# 11: compile-time error
    --set;               //# 12: compile-time error
    true && static;      //# 13: compile-time error
    ++typedef;           //# 14: compile-time error
  }
}

main() {
  new A().test();
}
