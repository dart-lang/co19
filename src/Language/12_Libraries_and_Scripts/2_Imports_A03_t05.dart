/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a name N is introduced into the import namespace 
 * of a library A, and another import also introduces N into the import namespace of A.
 * @description Checks that it is a compile-time error when a library imports (with the same prefix)
 * two distinct libraries that contain no declarations themselves but both import and re-export
 * a third library.
 * @compile-error
 * @author rodionov
 */

#import("2_Imports_A03_t04_p1_lib.dart", prefix: "P");
#import("2_Imports_A03_t04_p2_lib.dart", prefix: "P");

main() {
  try {
    foo x;
  } catch(var e) {}
}
