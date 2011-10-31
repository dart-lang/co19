/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Static type annotation grammar:
 * type:
 * qualified typeArguments?
 * ;
 * typeArguments:
 * '<' typeList '>'
 * ;
 * typeList:
 * type (',' type)*
 * ;
 * @description Checks that type can be qualified (imported from some library and used with prefix).
 * @author iefremov
 */

#import("somelib.dart", prefix:"somelibprefix");

main() {
  somelibprefix.ClassFromSomeLib v1;
  somelibprefix.ClassFromSomeLib<int, String, double> v2;
  somelibprefix.ClassFromSomeLib
    <
    somelibprefix.ClassFromSomeLib,
    somelibprefix.ClassFromSomeLib,
    somelibprefix.ClassFromSomeLib
    >
    v3;
}
