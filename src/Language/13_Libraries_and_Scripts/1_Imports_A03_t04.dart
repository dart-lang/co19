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
 * @description Checks that it is neither error nor warning if a library imports two
 * other libraries exporting the same name, references that name in an explicit type test 
 * and other expressions, but it's hidden in one of the import declarations of A 
 * (so there's actually no name clash).
 * @author rodionov
 */

import "1_Imports_A03_t01_p1_lib.dart" hide foo, Bar;
import "1_Imports_A03_t01_p2_lib.dart";

class Foo2 extends foo {
}

class Foo3<T extends foo> {
}

main() {
  1 is foo;
  null as foo;
  new foo();
  new Foo2();
  new Foo3<Foo2>();
  Bar.BAR;
  Bar.BAR = 11;
}
