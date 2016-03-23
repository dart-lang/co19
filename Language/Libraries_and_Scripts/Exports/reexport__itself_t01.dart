/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion For each entry mapping key k to declaration d in N Sn an entry
 * mapping k to d is added to the exported namespace of L unless a top-level
 * declaration with the name k exists in L.
 * @description Checks that it is not a compile-time error if this library
 * imports another which re-exports itself and none of the names exported by it
 * are referenced in this library, because the imported library's top-level
 * declarations prevent second copies of them from being added to the export
 * namespace via an explicit export declaration so there's no ambiguity.
 * @author rodionov
 * @reviewer kaigorodov
 */

import "reexport__itself_t01_lib.dart";

main() {
  libVar++;
}
