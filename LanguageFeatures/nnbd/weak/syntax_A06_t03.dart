// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The grammar of selectors is extended to allow null-aware
/// subscripting using the syntax e1?[e2] which evaluates to null if e1
/// evaluates to null and otherwise evaluates as e1[e2].
///
/// @description Check that the grammar of selectors is extended to allow
/// null-aware subscripting using the syntax e1?[e2] which evaluates to null if
/// e1 evaluates to null and otherwise evaluates as e1[e2]. Test legacy pre-NNBD
/// types
/// @author sgrekhov@unipro.ru
/// @issue 39865

// Requirements=nnbd-weak
import "../../../Utils/expect.dart";
import "legacy_lib.dart";

main() {
  A? a = null;
  Expect.isNull(a?[42]);
  a = new A();
  Expect.equals(42, a?[42]);
//                   ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//                  ^
// [cfe] Operand of null-aware operation '?.' has type 'A' which excludes null.
}
