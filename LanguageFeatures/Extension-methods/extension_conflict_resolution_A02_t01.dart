/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If more than one extension applies to a specific member
 * invocation, then we resort to a heuristic to choose one of the extensions to
 * apply. If exactly one of them is "more specific" than all the others, that
 * one is chosen. Otherwise it is a compile-time error.
 * An extension with [on] type clause [T1] is more specific than another
 * extension with [on] type clause [T2] iff
 *   1. The latter extension is declared in a platform library, and the former
 *   extension is not
 * @description Check that compile time error is thrown if two extension members
 * are equitable
 * @compile-error
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

import "extension_conflict_resolution_lib.dart";
import "../../Utils/expect.dart";

extension MyFancyList<T> on List<T> {
  bool get isLibraryVersion => false;
}

main() {
  List aList = [];
  Expect.isFalse(aList.isLibraryVersion);
}
