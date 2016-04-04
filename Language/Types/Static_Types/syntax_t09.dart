/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Static type annotations are used in variable declarations
 * (including formal parameters), in the return types of functions and in the
 * bounds of type variables. Static type annotations are used during static
 * checking and when running programs in checked mode. They have no effect
 * whatsoever in production mode.
 * type:
 *   typeName typeArguments?
 * ;
 * typeName:
 *   qualified
 * ;
 * typeArguments:
 *   '<' typeList '>'
 * ;
 * typeList:
 *   type (',' type)*
 * ;
 * @description Checks that using fully qualified type name allows to import it
 * from some library.
 * @author iefremov
 * @reviewer rodionov
 */

import "../somelib.dart" as somelibprefix;

main() {
  somelibprefix.ClassFromSomeLib v1;
  somelibprefix.ClassFromSomeLib<int, String, double> v2;
  somelibprefix.ClassFromSomeLib
    <
    somelibprefix.ClassFromSomeLib<int, bool, double>,
    somelibprefix.ClassFromSomeLib<bool, int, double>,
    somelibprefix.ClassFromSomeLib
    >
    v3;
}
