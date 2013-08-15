/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a name N is referenced by a library L and N is introduced into the top
 * level scope L by more than one import then:
 * - A static warning occurs.
 * - If N is referenced as a function, getter or setter, a NoSuchMethodError is raised.
 * - If N is referenced as a type, it is treated as a malformed type.
 * It is neither an error nor a warning if N is introduced by two or more imports
 * but never referred to.
 * @description Checks that it is static warning and not a dynamic type error in checked mode if that name 
 * is referenced during an implicit subtype test (assignment of a statically typed variable).
 * @static-warning
 * @author kaigorodov
 * @reviewer rodionov
 */
import "../../Utils/dynamic_check.dart";

import "1_Imports_A03_t21_p1_lib.dart";
import "1_Imports_A03_t21_p2_lib.dart";
import "1_Imports_A03_t21_p2_lib.dart" as P2;

foo bar; /// static-warning doubly imported type used as a type annotation

main() {
  bar = new P2.foo();
}
