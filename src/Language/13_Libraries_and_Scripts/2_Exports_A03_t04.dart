/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a name N is referenced or re-exported by a
 * library A and N is introduced into the import namespace of A by more than one import.
 * @description Checks that it is a not a compile-time error if two different libraries 
 * imported with empty prefixes introduce the same name to the import namespace of A,
 * but A neither references nor re-exports it.
 * @author rodionov
 */

import "2_Exports_A03_t01_p1_lib.dart";
import "2_Exports_A03_t01_p2_lib.dart";

main() {
}
