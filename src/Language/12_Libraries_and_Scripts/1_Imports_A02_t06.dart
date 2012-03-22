/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An import specifies a URI where the declaration of the imported library
 * is to be found. The effect of an import of library B with prefix P within the
 * declaration of library A is:
 * - If P is the empty string, each non-private top level declaration d of B is
 * added to the scope of A.
 * - Otherwise, each non-private top level declaration d of B is added to the
 * scope of A under the name P.d, as is the name P.
 * @description Checks that library may be imported with different prefixes.
 * @author vasya
 * @reviewer hlodvig
 * @needsreview issue 1774
 */

#import("1_Imports_lib.dart");
#import("1_Imports_lib.dart", prefix: "A");
#import("1_Imports_lib.dart", prefix: "B");
#import("1_Imports_lib.dart", prefix: "C");

main() {
  Expect.equals(1, foo);
  Expect.equals(1, A.foo);
  Expect.equals(1, B.foo);
  Expect.equals(1, C.foo);
}

