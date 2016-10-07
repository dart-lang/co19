/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let E be an export directive that refers to a URI via the string
 * s1. Evaluation of E proceeds as follows:
 * First,
 * • If the URI that is the value of s1 has not yet been accessed by an import
 *   or export directive in the current isolate then the contents of the URI
 *   are compiled to yield a library B.
 * • Otherwise, the contents of the URI denoted by s1 have been compiled into
 *   a library B within the current isolate.
 * Let NS0 be the exported namespace of B. Then, for each combinator clause
 * Ci, i in 1..n in E:
 * • If Ci is of the form show id1, ..., idk then let
 *   NSi = show([id1, ..., idk], NSi-1).
 * • If Ci is of the form hide id1, ..., idk then let
 *   NSi = hide([id1, ..., idk], NSi-1).
 *
 * For each entry mapping key k to declaration d in NSn an entry mapping k to
 * d is added to the exported namespace of L unless a top-level declaration
 * with the name k exists in L.
 *
 * @description Checks that the combined effect of show and hide combinators in
 * an export declaration is calculated as specified.
 * @note Most of this is already covered by 1_Imports_A02* tests.
 * @author rodionov
 * @reviewer kaigorodov
 */
import "../../../Utils/expect.dart";

import "show_hide_t02_lib.dart";

main() {
  Expect.equals(1, foo()); // from lib2/lib22
  Expect.equals(2, bar); // from lib3/lib33
  Expect.equals(true, boo); // from lib2/lib22
  Expect.equals("static2", C.SF); // from lib3/lib33
}
