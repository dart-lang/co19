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
 *   Dynamic |
 *   factory |
 *   get |
 *   implements |
 *   import |
 *   interface |
 *   library |
 *   negate |
 *   operator |
 *   set |
 *   source |
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
  Dynamic Dynamic;
  Dynamic;
  var factory;
  factory;
  int get;
  get;
  String implements;
  implements;
  var import;
  import;
  int interface;
  interface;
  var library;
  library;
  double negate;
  negate;
  int operator;
  operator;
  var set;
  set;
  var source;
  source;
  int static;
  static;
  Function typedef;
  typedef;
  A.static;
}