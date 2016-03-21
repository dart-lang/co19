/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If a name N is referenced by a library L and N is introduced into
 * the top level scope L by more than one import, and not all the imports denote
 * the same declaration, then:
 * • A static warning occurs.
 * • If N is referenced as a function, getter or setter, a NoSuchMethodError is
 *   raised.
 * • If N is referenced as a type, it is treated as a malformed type.
 * It is neither an error nor a warning if N is introduced by two or more
 * imports but never referred to.
 * @description Checks that it is neither error nor warning if a library imports
 * two other libraries exporting the same name (one of them via re-export),
 * references that name in an explicit type test and other expressions, but
 * it's hidden in one of the import declarations of L (so there's actually no
 * name clash).
 * @static-clean
 * @author rodionov
 * @reviewer kaigorodov
 */

import "same_name_t11_p1_lib.dart" hide foo, Bar, id;
import "same_name_t11_p2_lib.dart";

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
  id is foo;
}
