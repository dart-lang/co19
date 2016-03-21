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
 * @description Checks that it is not a static warning or error if the same
 * library is imported twice with empty prefixes and introduces a type name to
 * the top-level scope of L, which L uses as a type annotation in a type cast
 * expression.
 * @static-clean
 * @author rodionov
 * @reviewer kaigorodov
 */

import "same_name_t30_lib.dart";
import "same_name_t30_lib.dart";

main() {
  try {
    1 as foo;
  } catch (anything) {}
}
