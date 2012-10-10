/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An identifier expression consists of a single identifier; it provides access to an
 * object via an unqualified name.
 * BUILT_IN_IDENTIFIER:
 *   abstract |
 *   as |
 *   dynamic |
 *   export |
 *   external |
 *   factory |
 *   get |
 *   implements |
 *   import |
 *   library |
 *   operator |
 *   part |
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
  var as;
  as;
  dynamic dynamic;
  dynamic;
  String export;
  export;
  var external;
  external;
  var factory;
  factory;
  int get;
  get;
  String implements;
  implements;
  int import;
  import;
  double library;
  library;
  int operator;
  operator;
  dpuble part;
  part;
  var set;
  set;
  int static;
  static;
  Function typedef;
  typedef;
  A.static;
}
