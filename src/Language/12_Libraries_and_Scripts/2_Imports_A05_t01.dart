/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error to import two or more namespaces that define the
 * same name.
 * @description Checks that it is a compile-time error to import two or more libraries 
 * that define the same library name.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 * @needsreview http://code.google.com/p/dart/issues/detail?id=1774
 */

//#import("2_Imports_A05_t01_lib.dart");
// both libraries define the same library name in their respective headers
#import("2_Imports_A05_t01_p1_lib.dart", prefix: "P1");
#import("2_Imports_A05_t01_p2_lib.dart", prefix: "P2");

main() {
}
