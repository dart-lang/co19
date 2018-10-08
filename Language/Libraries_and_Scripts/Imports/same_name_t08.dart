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
 * @assertion (Expressions/Instance Creation/New) If T is malformed a dynamic
 * error occurs.
 * @description Checks that it is a compile error if two different
 * libraries introduce the same name T to the top level scope of L.
 * Checks that a compile error occurs if T is used in new instance creation
 * expression.
 * @compile-error
 * @author kaigorodov
 */
import "same_name_t01_p1_lib.dart";
import "same_name_t01_p2_lib.dart";

main() {
  new foo();
}
