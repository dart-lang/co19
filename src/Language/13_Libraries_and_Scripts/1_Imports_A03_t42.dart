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
 * @description Checks that it is a dynamic error in checked mode and a static warning 
 * if two different libraries imported with empty prefixes introduce the same name 
 * to the top-level scope of A (both via re-export of a third library) and A uses it 
 * in a type test as a type annotation.
 * @static-warning
 * @author rodionov
 * @issue 5399
 */
import "../../Utils/dynamic_check.dart";

import "1_Imports_A03_t41_p1_lib.dart";
import "1_Imports_A03_t41_p2_lib.dart";

main() {
  checkTypeError(f() {
    1 is foo;
  });
}
