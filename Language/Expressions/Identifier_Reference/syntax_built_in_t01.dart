/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An identifier expression consists of a single identifier; it
 * provides access to an object via an unqualified name.
 * BUILT_IN_IDENTIFIER:
 *   abstract |
 *   as |
 *   deferred |
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
 * @description Checks that built-in identifiers can be used to name variables.
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
  var deferred;
  deferred;
  var dynamic;
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
  double part;
  part;
  var set;
  set;
  int static;
  static;
  Function typedef;
  typedef;
  A.static;
}
