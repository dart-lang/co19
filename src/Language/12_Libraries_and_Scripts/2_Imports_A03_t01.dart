/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a name N is introduced into the import namespace 
 * of a library A, and another import also introduces N into the import namespace of A.
 * @description Checks that it is a compile-time error if two different libraries imported with empty
 * prefixes introduce the same name to the import namespace of A.
 * @compile-error
 * @author vasya
 * @reviewer rodionov
 */

#import("2_Imports_A03_t01_p1_lib.dart");
#import("2_Imports_A03_t01_p2_lib.dart");

main() {
  try {
    foo x;
  } catch(var e) {}
}
