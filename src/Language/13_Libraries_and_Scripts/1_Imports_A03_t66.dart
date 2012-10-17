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
 * @description Checks that it is a static warning and not a compile-time error if the same 
 * library is imported twice with empty prefixes and introduces a name to the top level scope 
 * of A, which A uses as a type parameter bound.
 * @static-warning
 * @author rodionov
 * @needsreview issue 5399
 */

import "1_Imports_A03_t61_lib.dart";
import "1_Imports_A03_t61_lib.dart";

class Foo2<T extends foo> {
}

main() {
  new Foo2();
  new Foo2<int>();
}
