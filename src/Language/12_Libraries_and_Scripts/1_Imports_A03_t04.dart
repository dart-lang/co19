/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a name N is introduced into the library scope
 * of a library A, and either:
 * - N is declared by A, OR
 * - Another import introduces N into the scope of A.
 * @description Checks that it is a compile-time error if a name N is introduced into the 
 * library scope and another import introduces N into the scope of A. Prefix is not empty.
 * @compile-error
 * @author vasya
 * @reviewer msyabro
 */

#import("1_Imports_A03_t03_p1_lib.dart", prefix: 'P');
#import("1_Imports_A03_t03_p2_lib.dart", prefix: 'P');

main() {
  try {
    P.foo x;
  } catch(var e) {}
}
