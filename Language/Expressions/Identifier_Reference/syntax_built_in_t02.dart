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
 * @description Checks that built-in identifiers can be used to name local
 * functions.
 * @author kaigorodov
 * @reviewer rodionov
 */

main() {
  int abstract()=>1;
  var a=abstract();
  int as()=>1;
  int dynamic()=>1;
  int export()=>1;
  int external()=>1;
  int factory()=>1;
  int get()=>1;
  int implements()=>1;
  int import()=>1;
  int library()=>1;
  int operator()=>1;
  int part()=>1;
  int set()=>1;
  int static()=>1;
  int typedef()=>1;
}
