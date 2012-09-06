/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a name N is referenced or re-exported by a
 * library A and N is introduced into the import namespace of A by more than one import.
 * @description Checks that it is a not a compile-time error if a library imports two
 * other libraries exporting the same name (one declaring it directly and the other re-exporting
 * it from a third library), both references and re-exports that name itself, but it's hidden 
 * in one of the import declarations of A (so there's actually no name clash).
 * @author rodionov
 */

import "2_Imports_A03_t11_p1_lib.dart" hide foo;
import "2_Imports_A03_t11_p2_lib.dart" & export;

main() {
  foo x;
}
