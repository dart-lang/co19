/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a name N is re-exported by a library L and N
 * is introduced into the export namespace of L by more than one export.
 * @description Checks that it is not a compile-time error if this library imports another which
 * re-exports itself and the names exported by that library are referenced in this one, because
 * the imported library's top-level declarations prevent second copies of them from being added
 * to the export namespace via an explicit export declaration so there's no ambiguity.
 * @author rodionov
 */

import "2_Exports_A04_t06_lib.dart";

main() {
  () {} is foo;
}
