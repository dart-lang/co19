// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile time error to read a local variable when the
/// variable is definitely unassigned unless the variable is non-`final`, and
/// non-`late`, and has nullable type.
///
/// @description Check that is a compile time error to read a local variable
/// marked `late` when the variable is definitely unassigned. Test implicit read
/// via the null-aware assignment.
/// @author sgrekhov@unipro.ru
/// @issue 39876
/// @issue 40943

main() {
  late num x;
  x ??= 1; // ignore: dead_null_aware_expression, dead_code
//^
// [analyzer] unspecified
// [cfe] unspecified
}
