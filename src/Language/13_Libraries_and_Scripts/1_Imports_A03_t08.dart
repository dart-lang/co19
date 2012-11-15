/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a name N is referenced by a library L and N is introduced into the top
 * level scope L by more than one import then:
 * - It is a static warning if N is used as a type annotation.
 * - In checked mode, it is a dynamic error if N is used as a type annotation
 *   and referenced during a subtype test.
 * - Otherwise, it is a compile-time error.
 * @description Checks that it is a compile-time error if two different libraries 
 * introduce the same name to the top level scope of A and A uses it as 
 * a type name reference in an instance creation expression.
 * @compile-error
 * @author rodionov
 * @issue 5399, 6736
 */

import "1_Imports_A03_t01_p1_lib.dart";
import "1_Imports_A03_t01_p2_lib.dart";

main() {
  try {
    new foo();
  } catch(ok) {}
}
