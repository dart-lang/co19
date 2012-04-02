/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An identifier expression consists of a single identifier; it provides access to an
 * object via an unqualified name.
 * identifier:
 *   IDENTIFIER_NO_DOLLAR |
 *   IDENTIFIER |
 *   BUILD_IN_IDENTIFIER
 * ;
 * BUILT_IN_IDENTIFIER:
 *   abstract |
 *   assert |
 *   call |
 *   Dynamic |
 *   equals |
 *   factory |
 *   get |
 *   implements |
 *   interface |
 *   negate |
 *   operator |
 *   set |
 *   static |
 *   typedef
 * ;
 * @description Checks that BUILT_IN_IDENTIFIERs can be used as identifiers for variables
 * @author msyabro
 * @reviewer kaigorodov 
 */

class A {
  static int static;
}

main() {
  var abstract;
  abstract;
  bool assert;
  assert;
  var call;
  call;
  Dynamic Dynamic;
  Dynamic;
  String equals;
  equals;
  var factory;
  factory;
  int get;
  get;
  String implements;
  implements;
  int interface;
  interface;
  double negate;
  negate;
  int operator;
  operator;
  var set;
  set;
  int static;
  static;
  Function typedef;
  typedef;
  A.static;
}