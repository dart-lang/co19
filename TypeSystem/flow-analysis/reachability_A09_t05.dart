// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion operator!= If `N` is an expression of the form `E1 != E2`, it is
/// treated as equivalent to the expression `!(E1 == E2)`.
///
/// @description Checks that an expression of the form `E1 != E2` is treated as
/// equivalent to the expression `!(E1 == E2)`. Test `equivalentToNull(T1)` and
/// `T2` is non-nullable, or `equivalentToNull(T2)` and `T1` is non-nullable
/// case.
/// @author sgrekhov@unipro.ru
/// @issue 41985
/// @issue 60114

String get s => "Lily was here";

main() {
  int i;
  late int j;
  if (null != s) { // ignore: unnecessary_null_comparison
    i = 42; // `i` is definitely assigned here
  } else {
    j = 42;
  }
  i; // It is not an error to read a local non-nullable variable which is definitely assigned
  j; // Still definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}
