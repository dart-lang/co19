/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a name N is referenced or re-exported by a
 * library A and N is introduced into the import namespace of A by more than one import.
 * @description Checks that it is a compile-time error when a library A imports (with the same prefix)
 * two distinct libraries that contain no declarations themselves but both import and re-export
 * a third library D and A references a declaration from D. 
 * @compile-error
 * @author rodionov
 */

import "2_Imports_A03_t21_p1_lib.dart" as P;
import "2_Imports_A03_t21_p2_lib.dart" as P;

main() {
  try {
    foo x;
  } catch(e) {}
}
