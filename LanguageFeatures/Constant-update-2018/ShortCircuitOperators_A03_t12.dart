// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The [??] operator only evaluates its second operand if the first
/// evaluates to [null], and the second operand must be a potentially constant
/// expression.
/// @description Checks that compile-time exception is not thrown if the first
/// operand of [??] operator is not [null] regardless of the actual type of the
/// second operand.
/// @author iarkh@unipro.ru


const int? i = 1;
const dynamic d1 = 11;
const String? d2 = "check me here";

main() {
  const String s1 = "" ?? (124 as String);
//                        ^^^^^^^^^^^^^^^
// [analyzer] STATIC_WARNING.DEAD_NULL_AWARE_EXPRESSION
//                  ^
// [cfe] Operand of null-aware operation '??' has type 'String' which excludes null.
  const int i1 = i ?? ("" as int);
  const String s2 = d2 ?? d1;
  const int i2 = d1 ?? d2;
}
